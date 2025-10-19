from dataset_utils import *
import torch, re
from transformers import AutoTokenizer, AutoModel, AutoConfig
import transformers
print("transformers version:", transformers.__version__)

import torch.nn.functional as F
from torch_geometric.nn.conv import SAGEConv, GCNConv, GATConv
from torch_geometric.nn.dense import Linear
from torch_geometric.nn.models import JumpingKnowledge
from torch_geometric.nn.pool import global_add_pool, global_max_pool, SAGPooling
from torch_geometric.data import Batch
from functools import partial
from torch.utils.data import Dataset, DataLoader as TorchDataLoader

target = ['lut', 'ff', 'dsp', 'bram', 'uram', 'srl', 'cp', 'power']
tar_idx = 6
jknFlag = 0

tokenizer = AutoTokenizer.from_pretrained("Salesforce/codet5-base")

def move_token_batch_to_device(token_batch, device):
    """
    Accept token_batch that may be:
      - transformers.BatchEncoding (mapping-like),
      - dict of tensors/lists,
      - list/other (leave as-is).
    Returns a plain dict where tensor/list values are converted to torch.Tensor on `device`.
    """
    # duck-typing: if has .items(), treat as mapping
    if not hasattr(token_batch, "items"):
        return token_batch

    out = {}
    for k, v in token_batch.items():
        if torch.is_tensor(v):
            out[k] = v.to(device)
        elif isinstance(v, (list, tuple)):
            # assume list of ints (input ids / masks)
            out[k] = torch.tensor(v, dtype=torch.long, device=device)
        else:
            # fallback: try converting if possible, else keep
            try:
                out[k] = torch.tensor(v, device=device)
            except Exception:
                out[k] = v
    return out

class PairDataset(Dataset):
    def __init__(self, pairs):
        self.pairs = list(pairs)
    def __len__(self):
        return len(self.pairs)
    def __getitem__(self, idx):
        return self.pairs[idx]

def collate_graph_code_tokenize(batch, tokenizer, max_length=512):
    graphs = [item[0] for item in batch]
    codes = [item[1] if item[1] is not None else "" for item in batch]
    #print(">>> collate_graph_code_tokenize: batch size =", len(graphs))
    #print(">>> collate_graph_code_tokenize: codes =", codes)
    batched_graph = Batch.from_data_list(graphs)

    toks = tokenizer(
        codes,
        padding=True,
        truncation=True,
        max_length=max_length,
        return_tensors="pt"
    )
    #print(">>> collate_graph_code_tokenize: input_ids shape =", toks["input_ids"].shape)
    return batched_graph, toks

def freeze_first_k_blocks(model: torch.nn.Module, k: int = 2, freeze_shared_embeddings: bool = False):
    """
    Freeze encoder.block.{0..k-1} parameters (set requires_grad=False).
    Keep other parameters unchanged except ensure projection/cross-attn heads remain trainable.
    Args:
        model: instance of SummaryTextEncoder
        k: number of first encoder blocks to freeze (k=2 -> freeze block 0 and 1)
        freeze_shared_embeddings: whether to also freeze shared token embeddings (default False)
    """
    # 1) Freeze block-level params
    found_any = False
    for name, p in model.transformer.named_parameters():
        m = re.search(r'encoder\.block\.(\d+)\.', name)
        if m:
            found_any = True
            idx = int(m.group(1))
            if idx < k:
                p.requires_grad = False
            else:
                p.requires_grad = True  # ensure later blocks are trainable
    if not found_any:
        print("Warning: didn't find encoder.block.* in model.transformer.named_parameters(). Check HF model naming.")

    # 2) Optionally freeze shared embeddings (T5 usually has 'shared' or 'embed_tokens')
    if freeze_shared_embeddings:
        for name, p in model.transformer.named_parameters():
            if any(x in name for x in ["shared", "embed_tokens", "token_embeddings", "word_embeddings"]):
                p.requires_grad = False

    # 3) Ensure projection and cross-attention related modules remain trainable
    for name, p in model.named_parameters():
        if any(kstr in name for kstr in ["graph_proj", "out_proj", "graph_seq_proj", "cross_attn", "cross_attn_ln", "cross_attn_dropout"]):
            p.requires_grad = True

    # 4) Print summary for verification
    total_params = sum(p.numel() for p in model.parameters())
    trainable_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    #print(f"Total params: {total_params:,}, Trainable params: {trainable_params:,} ({100.*trainable_params/total_params:.2f}%)")

    # Optional: list which encoder blocks are frozen/trainable (for quick check)
    blocks = {}
    for name, p in model.transformer.named_parameters():
        m = re.search(r'encoder\.block\.(\d+)\.', name)
        if m:
            idx = int(m.group(1))
            blocks.setdefault(idx, {"total":0, "trainable":0})
            blocks[idx]["total"] += p.numel()
            if p.requires_grad:
                blocks[idx]["trainable"] += p.numel()
    for idx in sorted(blocks.keys()):
        t = blocks[idx]
        pct = 100.*t["trainable"]/t["total"] if t["total"]>0 else 0.0
        print(f"block.{idx}: trainable {t['trainable']:,}/{t['total']:,} ({pct:.1f}%)")

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.nn import Linear
from transformers import AutoTokenizer, AutoConfig, AutoModel

# ------------------ SummaryTextEncoder (interleaved) ------------------
class SummaryTextEncoder(torch.nn.Module):
    def __init__(self,
                 model_name="Salesforce/codet5-small",
                 graph_dim=128,
                 out_dim=128,
                 use_cross_attn=True,
                 graph_slots=4,
                 cross_attn_dropout=0.1):
        super().__init__()
        # tokenizer + config + model
        self.tokenizer = AutoTokenizer.from_pretrained(model_name)
        config = AutoConfig.from_pretrained(model_name)
        self.transformer = AutoModel.from_pretrained(model_name, config=config)

        # Optionally keep only first 3 encoder blocks (你之前的选择)
        self.transformer.encoder.block = torch.nn.ModuleList(
            list(self.transformer.encoder.block)[:3]
        )
        self.transformer.config.num_hidden_layers = len(self.transformer.encoder.block)
        self.num_encoder_blocks = len(self.transformer.encoder.block)

        # projection of graph summary -> transformer hidden size (compat)
        self.graph_proj = nn.Linear(graph_dim, config.hidden_size)

        # cross-attn machinery: per-layer projector + single shared MHA
        self.use_cross_attn = use_cross_attn
        self.graph_slots = max(1, graph_slots)
        self.hidden_size = config.hidden_size
        self.transformer.config.use_cache = False


        if self.use_cross_attn:
            # a projector for each encoder block to map gnn vector -> G * H
            self.graph_proj_per_layer = nn.ModuleList([
                nn.Linear(graph_dim, config.hidden_size * self.graph_slots)
                for _ in range(self.num_encoder_blocks)
            ])
            # reuse a single MHA for all layers (参数和显存更节省)
            n_heads = getattr(config, "num_attention_heads", None)
            if n_heads is None:
                n_heads = 8
            self.cross_attn = nn.MultiheadAttention(embed_dim=config.hidden_size,
                                                    num_heads=n_heads,
                                                    batch_first=True)
            self.cross_attn_ln = nn.LayerNorm(config.hidden_size)
            self.cross_attn_dropout = nn.Dropout(cross_attn_dropout)

        # projection of transformer CLS embedding -> desired out_dim
        self.out_proj = nn.Linear(config.hidden_size, out_dim)
        self.out_dim = out_dim

    def forward(self, code_list, graph_summary, gnn_h_list=None, debug=False):
        """
        Robust interleaved forward for transformers 4.54.1 (and similar).
        It tries multiple block(...) calling signatures, extracts/propagates position_bias,
        and injects cross-attn after each encoder block. If per-layer calling fails,
        falls back to single-shot encoder call and applies cross-attn after encoder.
        """
        # 1) project graph summary -> CLS
        cls_emb = self.graph_proj(graph_summary)  # [B, H]

        # 2) tokenization / accept pre-tokenized dict-like
        if hasattr(code_list, "items") and ("input_ids" in code_list) and ("attention_mask" in code_list):
            if debug: print(">>> SummaryTextEncoder: using pre-tokenized code input")
            input_ids = code_list["input_ids"]
            attention = code_list["attention_mask"]
            if not torch.is_tensor(input_ids):
                input_ids = torch.tensor(input_ids, dtype=torch.long, device=cls_emb.device)
            else:
                input_ids = input_ids.to(cls_emb.device)
            if not torch.is_tensor(attention):
                attention = torch.tensor(attention, dtype=torch.long, device=cls_emb.device)
            else:
                attention = attention.to(cls_emb.device)
        else:
            if debug: print(">>> SummaryTextEncoder: tokenizing raw text input")
            tok = self.tokenizer(code_list, padding=True, truncation=True, max_length=512, return_tensors="pt")
            input_ids = tok["input_ids"].to(cls_emb.device)
            attention = tok["attention_mask"].to(cls_emb.device)

        # 3) token embeddings, prepend CLS
        embed_layer = self.transformer.get_input_embeddings()
        token_embs = embed_layer(input_ids)  # [B, L, H]
        cls_emb = cls_emb.unsqueeze(1)       # [B,1,H]
        seq = torch.cat([cls_emb, token_embs], dim=1)  # [B, L+1, H]

        # 4) attention mask: prepend 1 for CLS
        cls_mask = torch.ones((attention.size(0), 1), device=attention.device, dtype=attention.dtype)
        attn_mask = torch.cat([cls_mask, attention], dim=1)  # [B, L+1]
        # ensure bool mask for HF internals
        if attn_mask.dtype != torch.bool:
            attn_mask = attn_mask.to(dtype=torch.bool, device=attn_mask.device)

        # 5) prepare for per-layer loop
        hidden_states = seq
        position_bias = None
        # track which signatures have raised errors at least once so we can avoid re-trying them repeatedly
        failed_sigs = set()

        # helper: try a block call with many plausible kw argument orders
        def try_block_call(block, hs, mask, pos_bias):
            """
            Try multiple variants of calling block(...) to maximize compatibility across HF versions.
            Returns (out, used_variant_str) on success, or raises the final exception.
            """
            # list of candidate kwargs orders to try (each is a dict)
            candidates = [
                {"hidden_states": hs, "attention_mask": mask, "position_bias": pos_bias, "return_dict": True, "use_cache": False},
                {"hidden_states": hs, "attention_mask": mask, "position_bias": pos_bias, "use_cache": False, "return_dict": True},
                {"hidden_states": hs, "attention_mask": mask, "return_dict": True, "use_cache": False},  # no pos
                {"hidden_states": hs, "attention_mask": mask, "position_bias": pos_bias, "return_dict": False, "use_cache": False},
                {"hidden_states": hs, "attention_mask": mask, "return_dict": False, "use_cache": False},
                # positional style (some versions accept positional args: (hidden_states, attention_mask, position_bias, ...))
                None  # placeholder to try positional call as last resort
            ]

            last_exc = None
            for idx, kw in enumerate(candidates):
                sig_name = f"cand_{idx}"
                if sig_name in failed_sigs:
                    continue
                try:
                    if kw is None:
                        # try positional call: pass hs, mask, pos_bias as first three args if pos_bias not None
                        if pos_bias is not None:
                            out = block(hs, mask, pos_bias, False, False)
                        else:
                            out = block(hs, mask, False, False)
                        return out, sig_name
                    else:
                        # remove None values to avoid TypeError for versions that don't accept a kw
                        call_kw = {k: v for k, v in kw.items() if v is not None}
                        out = block(**call_kw)
                        return out, sig_name
                except TypeError as e:
                    # signature mismatch, record and try next
                    failed_sigs.add(sig_name)
                    last_exc = e
                    continue
                except Exception as e:
                    # for non-TypeError, return immediately to be handled by outer code (these may be runtime errors)
                    raise
            # if reached here, all candidate signature attempts failed with TypeError
            raise last_exc if last_exc is not None else RuntimeError("Block call failed with unknown error")

        # 6) iterate encoder blocks and inject cross-attn
        per_layer_success = True
        try:
            for i, block in enumerate(self.transformer.encoder.block):
                if debug:
                    print(f">>> block {i} input hidden_states.shape: {hidden_states.shape}")
                    print(f">>> attn_mask.shape/dtype: {attn_mask.shape}, {attn_mask.dtype}")
                    print(f">>> pos_bias is None? {position_bias is None}")

                # try calling block using helper
                out, used_sig = try_block_call(block, hidden_states, attn_mask, position_bias)

                # extract hidden_states robustly
                if hasattr(out, "last_hidden_state"):
                    hidden_states = out.last_hidden_state
                elif isinstance(out, (tuple, list)) and len(out) > 0 and torch.is_tensor(out[0]):
                    hidden_states = out[0]
                else:
                    raise RuntimeError("Cannot extract hidden states from block output; aborting interleaved mode.")

                # try to extract/update position_bias (varies across versions)
                new_pos = None
                if hasattr(out, "position_bias"):
                    new_pos = out.position_bias
                elif isinstance(out, (tuple, list)) and len(out) > 1:
                    # many HF versions return (hidden_states, present_key_value, position_bias, ...) or similar
                    for cand in out[1:4]:
                        if torch.is_tensor(cand):
                            new_pos = cand
                            break
                if new_pos is not None:
                    position_bias = new_pos

                # --- interleaved cross-attn if available ---
                if self.use_cross_attn and (gnn_h_list is not None) and (i < len(gnn_h_list)):
                    g = gnn_h_list[i]  # [B, graph_dim]
                    g_seq = self.graph_proj_per_layer[i](g).view(g.size(0), self.graph_slots, self.hidden_size)
                    attn_out, _ = self.cross_attn(
                        query=hidden_states,  # [B, L+1, H]
                        key=g_seq,            # [B, G, H]
                        value=g_seq           # [B, G, H]
                    )
                    hidden_states = hidden_states + self.cross_attn_dropout(attn_out)
                    hidden_states = self.cross_attn_ln(hidden_states)

        except Exception as e:
            # If anything failed during per-layer calling (e.g., runtime path still accessed cache_position),
            # fall back to safe single-shot encoder call and apply cross-attn after encoder.
            per_layer_success = False
            if debug:
                print(">>> interleaved per-layer mode failed with exception:", repr(e))
                print(">>> Falling back to single-shot encoder call (no interleaving).")

        # 7) fallback path: single-shot encoder call if per-layer failed
        if not per_layer_success:
            try:
                enc_out = self.transformer.encoder(
                    inputs_embeds=seq,
                    attention_mask=attn_mask,
                    return_dict=True,
                    output_hidden_states=False
                )
                hidden_states = enc_out.last_hidden_state
                # single cross-attn using last gnn vector if requested
                if self.use_cross_attn and (gnn_h_list is not None):
                    g = gnn_h_list[-1]
                    g_seq = self.graph_proj_per_layer[-1](g).view(g.size(0), self.graph_slots, self.hidden_size)
                    attn_out, _ = self.cross_attn(
                        query=hidden_states,
                        key=g_seq,
                        value=g_seq
                    )
                    hidden_states = hidden_states + self.cross_attn_dropout(attn_out)
                    hidden_states = self.cross_attn_ln(hidden_states)
            except Exception as e2:
                # If even single-shot fails, re-raise with context
                raise RuntimeError("Both interleaved and single-shot encoder forward failed.") from e2

        # 8) final CLS projection
        cls_final = hidden_states[:, 0, :]  # [B, H]
        if self.out_dim != self.hidden_size:
            out = self.out_proj(cls_final)
        else:
            out = cls_final
        return out
    


# ------------------ HierNet (return full h_list) ------------------
class HierNet(torch.nn.Module):
    def __init__(self, in_channels, hidden_channels, num_layers, conv_type, hls_dim, drop_out=0.0, pool_ratio=0.5):
        super(HierNet, self).__init__()

        self.drop_out = drop_out
        self.pool_ratio = pool_ratio
        if conv_type == 'gcn':
            conv = GCNConv
        elif conv_type == 'gat':
            conv = GATConv
        elif conv_type == 'sage':
            conv = SAGEConv
        else:
            conv = GCNConv

        self.convs = torch.nn.ModuleList()
        self.pools = torch.nn.ModuleList()

        for i in range(num_layers):
            if i == 0:
                self.convs.append(conv(in_channels, hidden_channels))
            else:
                self.convs.append(conv(hidden_channels, hidden_channels))
            self.pools.append(SAGPooling(hidden_channels, self.pool_ratio))
        if jknFlag:
            self.jkn = JumpingKnowledge('lstm', channels=hidden_channels, num_layers=2)

        self.global_pool = global_add_pool
        self.output_dim = hidden_channels * 2 + hls_dim
        self.first_layer_dim = 2*hidden_channels

    def forward(self, x, edge_index, batch, hls_attr):
        x = x.to(torch.float32)
        h_list = []

        for step in range(len(self.convs)):
            x = self.convs[step](x, edge_index)
            x = F.relu(x)
            x = F.dropout(x, p=self.drop_out, training=self.training)
            x, edge_index, _, batch, _, _ = self.pools[step](x, edge_index, None, batch, None)
            h = torch.cat([global_max_pool(x, batch), global_add_pool(x, batch)], dim=1)  # [B, 2*hidden]
            h_list.append(h)

        if jknFlag:
            x = self.jkn(h_list)
        # keep original fused final x (sum of pooled layers) and append hls_attr
        x = h_list[0] + h_list[1] + h_list[2]
        x = torch.cat([x, hls_attr], dim=-1)

        # IMPORTANT: return the full list of per-layer pooled vectors as well
        return x, h_list

# ------------------ MORPH (pass the h_list into text encoder) ------------------
class MORPH(torch.nn.Module):
    def __init__(self, in_channels, hidden_channels, num_layers, conv_type, hls_dim, drop_out=0.0, pool_ratio=0.5):
        super().__init__()
        # use provided dropout param (was hardcoded before)
        self.drop_out = drop_out
        self.graph_encoder = HierNet(
            in_channels=in_channels,
            hidden_channels=hidden_channels,
            num_layers=num_layers,
            conv_type=conv_type,
            hls_dim=hls_dim,
            drop_out=drop_out,
            pool_ratio=pool_ratio
        )

        # note: SummaryTextEncoder expects graph_dim == self.graph_encoder.first_layer_dim
        self.text_encoder = SummaryTextEncoder(
            model_name="Salesforce/codet5-small",
            graph_dim=self.graph_encoder.first_layer_dim
        )

        decoder_in_dim = self.text_encoder.out_dim + self.graph_encoder.output_dim
        self.channels = [decoder_in_dim, 64, 64, 1]
        self.decoder = torch.nn.ModuleList()
        for i in range(len(self.channels) - 1):
            fc = Linear(self.channels[i], self.channels[i + 1])
            self.decoder.append(fc)

    def forward(self, graph_data, code_list):
        # graph_data: x, edge_index, batch, hls_attr
        x, h_list = self.graph_encoder(
            graph_data.x,
            graph_data.edge_index,
            graph_data.batch,
            graph_data.hls_attr
        )  # x: [B, hidden*2 + hls_dim], h_list: list of [B, 2*hidden]

        # Use first pooled vector as legacy graph_summary but pass full h_list for interleaved cross-attn
        graph_summary = h_list[0]            # [B, graph_dim]
        joint = self.text_encoder(code_list, graph_summary, gnn_h_list=h_list)  # now interleaved fusion

        x = torch.cat([joint, x], dim=-1)
        for f in range(len(self.decoder)):
            if f < len(self.decoder) - 1:
                x = F.relu(self.decoder[f](x))
                x = F.dropout(x, p=self.drop_out, training=self.training)
            else:
                x = self.decoder[f](x)
        return x


def train(model, train_loader):
    model.train()
    total_mse = 0
    total_mape = 0
    for batch in train_loader:
        graph_data, code_data = batch
        graph_data = graph_data.to(device)
        code_data = move_token_batch_to_device(code_data, device)

        optimizer.zero_grad()

        out = model(graph_data, code_data)
        out = out.view(-1)
        true_y = graph_data['y'].t()

        mse = F.huber_loss(out, true_y[tar_idx]).float()
        mape = mape_loss(out, true_y[tar_idx]).float()

        loss = mse
        loss.backward()
        optimizer.step()

        total_mse += mse.item() * graph_data.num_graphs
        total_mape += mape.item() * graph_data.num_graphs

    ds = train_loader.dataset
    total_mse /= len(ds)
    total_mape /= len(ds)

    return total_mse, total_mape


def test(model, loader, epoch):
    model.eval()
    with torch.no_grad():
        mse = 0
        mape = 0
        y = []
        y_hat = []
        residual = []
        for graph_data, code_data in loader:
            graph_data = graph_data.to(device)
            code_data = move_token_batch_to_device(code_data, device)

            out = model(graph_data, code_data)
            out = out.view(-1)
            true_y = graph_data['y'].t()
            mse += F.huber_loss(out, true_y[tar_idx]).float().item() * graph_data.num_graphs  # MSE
            mape += mape_loss(out, true_y[tar_idx]).float().item() * graph_data.num_graphs  # MAPE
            y.extend(true_y[tar_idx].cpu().numpy().tolist())
            y_hat.extend(out.cpu().detach().numpy().tolist())
            residual.extend((true_y[tar_idx] - out).cpu().detach().numpy().tolist())
        if epoch % 10 == 0:
            print('pred.y:', out)
            print('data.y:', true_y[tar_idx])
        ds = loader.dataset
        mse = mse / len(ds)
        mape = mape / len(ds)
    return mse, mape


if __name__ == "__main__":
    batch_size = 32
    dataset_dir = os.path.abspath('../dataset/std')
    print(f"Dataset Directory: {dataset_dir}")
    model_dir = os.path.abspath('./model')
    dataset = os.listdir(dataset_dir)
    dataset_list = generate_dataset(dataset_dir, dataset, print_info=False)

    #train_ds, test_ds = split_dataset(dataset_list, shuffle=True, seed=128)
    train_pairs, test_pairs, train_graphs, test_graphs = split_dataset(
    dataset_list, shuffle=True, seed=6666, test_ratio=0.2, return_graphs=True
    )
    #print("train_ds y data: ", train_ds[0].y.view(-1))
    #print('train_ds size = {}, test_ds size = {}'.format(len(train_ds), len(test_ds)))
    # train_dataset = PairDataset(train_pairs)
    # test_dataset  = PairDataset(test_pairs)
    collate = partial(collate_graph_code_tokenize, tokenizer=tokenizer)

    train_loader = TorchDataLoader(train_pairs, batch_size=batch_size, shuffle=True, drop_last=True, collate_fn=collate, num_workers=0)
    test_loader = TorchDataLoader(train_pairs, batch_size=batch_size, shuffle=False, drop_last=False, collate_fn=collate, num_workers=0)

    data_ini, code_ini = next(iter(train_loader))
    print("Using DataLoader class:", type(train_loader))
    batch = next(iter(train_loader))  
    data_ini, code_ini = batch
    print(">>> collate executed. batched_graph type:", type(data_ini))
    if isinstance(code_ini, dict):
        print(">>> code input_ids shape:", code_ini['input_ids'].shape)
    else:
        print(">>> code batch type:", type(code_ini))


    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    model = MORPH(in_channels=15, hidden_channels=64, num_layers=3, conv_type='sage',
                    hls_dim=6, drop_out=0.0)
    model = model.to(device)
    print(model)

    LR = 0.001
    optimizer = torch.optim.Adam(model.parameters(), lr=LR, weight_decay=0.001)
    # scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer, gamma=0.9, last_epoch=-1)

    min_train_mape = 1
    min_test_mape = 1
    for epoch in range(500):
        train_loss, train_mape = train(model, train_loader)
        test_loss, test_mape = test(model, test_loader, epoch)
        print(f'Epoch: {epoch:03d}, Train Loss: {train_loss:.4f}, Test Loss: {test_loss:.4f}')
        print(f'Epoch: {epoch:03d}, Train MAPE: {train_mape:.4f}, Test MAPE: {test_mape:.4f}')

        if epoch % 10 == 0:
            # scheduler.step()
            for p in optimizer.param_groups:
                p['lr'] *= 0.9

        save_train = False
        if train_mape < min_train_mape:
            min_train_mape = train_mape
            save_train = True

        save_test = False
        if test_mape < min_test_mape:
            min_test_mape = test_mape
            save_test = True

        checkpoint_1 = {
            'model': model.state_dict(),
            'optimizer': optimizer.state_dict(),
            'epoch': epoch,
            'min_train_mape': min_train_mape
        }

        checkpoint_2 = {
            'model': model.state_dict(),
            'optimizer': optimizer.state_dict(),
            'epoch': epoch,
            'min_test_mape': min_test_mape
        }

        if save_train:
            torch.save(checkpoint_1, os.path.join(model_dir, target[tar_idx] + '_h64_d0_checkpoint_train.pt'))

        if save_test:
            torch.save(checkpoint_2, os.path.join(model_dir, target[tar_idx] + '_h64_d0_checkpoint_test.pt'))
    


    print('Min Train MAPE: ' + str(min_train_mape))
    print('Min Test MAPE: ' + str(min_test_mape))
