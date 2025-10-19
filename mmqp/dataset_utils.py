import os
import torch
import random
import numpy as np
from torch.utils.data import random_split


def msle_loss(output, target):
    output = torch.log(output + 1)
    target = torch.log(target + 1)
    return torch.mean(torch.square(output - target))


def mape_loss(output, target):
    return torch.mean(torch.abs((target - output) / target))


def mae_loss(output, target):
    return torch.mean(torch.abs(target - output))


def generate_dataset_ori(dataset_dir, dataset_name_list, print_info=False):
    dataset_list = list()
    for ds in dataset_name_list:
        if ds.endswith('_codes.pt'):
            continue
        ds_path = os.path.join(dataset_dir, ds)
        if os.path.isfile(ds_path):
            print('Loading dataset from:', ds_path)
            tem_data = torch.load(ds_path, weights_only=False)
            dataset_list = dataset_list + tem_data
            if print_info:
                print(ds_path)
    return dataset_list

def generate_dataset(dataset_dir, dataset_name_list, print_info=False):
    """
    Load graph and code pairs from a directory of .pt files.

    Args:
        dataset_dir (str): path to directory containing graph .pt files and optional *_codes.pt files.
        print_info (bool): whether to print load information.

    Returns:
        dataset_list (List[Tuple[Graph, Code, Tensor]]): list of (graph, code, target) tuples.
    """
    all_files = os.listdir(dataset_dir)
    base_names = {
        fn[:-3] for fn in all_files
        if fn.endswith('.pt') and not fn.endswith('_codes.pt')
    }

    dataset_list = []
    for base in sorted(base_names):
        graphs = torch.load(os.path.join(dataset_dir, base + '.pt'), weights_only=False)
        codes = (
            torch.load(os.path.join(dataset_dir, base + '_codes.pt'))
            if os.path.exists(os.path.join(dataset_dir, base + '_codes.pt'))
            else [None] * len(graphs)
        )
        for g, c in zip(graphs, codes):
            dataset_list.append((g, c))
        if print_info:
            print(f"Loaded {base}: {len(graphs)} samples")

    return dataset_list

def generate_dataset_llm(dataset_dir: str, dataset_name_list=None, print_info: bool=False):
    """
    """
    all_files = os.listdir(dataset_dir)
    base_names = {
        fn[:-3] for fn in all_files
        if fn.endswith('.pt')
        and not fn.endswith('_codes.pt')
        and not fn.endswith('_only_scripts.pt')
        and not fn.endswith('_only_codes.pt')
    }

    sorted_bases = sorted(base_names)
    n_bases = len(sorted_bases)

    if n_bases >= 10:
        train_bases = sorted_bases[:8]
        test_bases  = sorted_bases[-2:]
    elif n_bases >= 2:
        train_bases = sorted_bases[:-2]
        test_bases  = sorted_bases[-2:]
    else:
        train_bases = sorted_bases
        test_bases  = []

    if print_info:
        print(f"Found {n_bases} base types. Train types ({len(train_bases)}): {train_bases}")
        print(f"Test  types ({len(test_bases)}): {test_bases}")

    train_list = []
    test_list = []

    for base in sorted_bases:
        pt_path = os.path.join(dataset_dir, base + '.pt')
        if not os.path.exists(pt_path):
            if print_info:
                print(f"Warning: base file missing {pt_path}, skipping.")
            continue

        graphs = torch.load(pt_path, weights_only=False)

        codes_path = os.path.join(dataset_dir, base + '_only_codes.pt')
        codes = torch.load(codes_path) if os.path.exists(codes_path) else [None] * len(graphs)

        scripts_path = os.path.join(dataset_dir, base + '_only_scripts.pt')
        scripts = torch.load(scripts_path) if os.path.exists(scripts_path) else [None] * len(graphs)

        # Safety: ensure lengths match
        L = len(graphs)
        if len(codes) != L:
            # if codes shorter/longer, pad or truncate to match graphs
            if len(codes) < L:
                codes = list(codes) + [None] * (L - len(codes))
            else:
                codes = codes[:L]
        if len(scripts) != L:
            if len(scripts) < L:
                scripts = list(scripts) + [None] * (L - len(scripts))
            else:
                scripts = scripts[:L]

        target_list = train_list if base in train_bases else test_list if base in test_bases else None
        if target_list is None:
            target_list = train_list

        for g, c, s in zip(graphs, codes, scripts):
            target_list.append((g, c, s))

        if print_info:
            print(f"Loaded base '{base}': {L} samples -> {'train' if base in train_bases else 'test' if base in test_bases else 'train(fallback)'}")

    if print_info:
        print(f"Total train samples: {len(train_list)}")
        print(f"Total test  samples: {len(test_list)}")

    return train_list, test_list


def split_dataset_ori(all_list, shuffle=True, seed=6666):
    first_10_y = []
    for i in all_list[0:10]:
        first_10_y.append(i.y)
    print("first ten train graphs Y before shuffle:", first_10_y)

    if shuffle and seed is not None:
        np.random.RandomState(seed=seed).shuffle(all_list)
        print("seed number:", seed)
    elif shuffle and seed is None:
        random.shuffle(all_list)
        print("seed number:", seed)

    first_10_y = []
    for i in all_list[0:10]:
        first_10_y.append(i.y)
    print("first ten train graphs Y after shuffle:", first_10_y)

    train_ds, test_ds = random_split(all_list, [round(0.8 * len(all_list)), round(0.2 * len(all_list))],
                                     generator=torch.Generator().manual_seed(42))

    return train_ds, test_ds

from typing import List, Tuple, Any, Union

def _get_graph(elem):
    if isinstance(elem, (tuple, list)) and len(elem) > 0:
        return elem[0]
    return elem

def _safe_y_str(g):
    y = getattr(g, "y", None)
    if y is None:
        return "None"
    try:
        if hasattr(y, "item"):
            return str(y.item())
        return str(y)
    except Exception:
        return str(y)

def split_dataset(
    all_list: List[Union[Any, Tuple[Any, Any]]],
    shuffle: bool = True,
    seed: Union[int, None] = 6666,
    test_ratio: float = 0.2,
    return_graphs: bool = False
):
    """
    """
    if len(all_list) == 0:
        raise ValueError("all_list is empty")

    # 打印 shuffle 之前前 10 个 graph 的 y（若存在）
    first_10_y = []
    for item in all_list[:10]:
        g = _get_graph(item)
        first_10_y.append(_safe_y_str(g))
    print("first ten graphs' y before shuffle:", first_10_y)

    # shuffle（保持 pair 对齐）
    if shuffle:
        if seed is not None:
            rng = np.random.RandomState(seed)
            rng.shuffle(all_list)  # in-place
            print("shuffled with seed:", seed)
        else:
            random.shuffle(all_list)
            print("shuffled with random seed")

    # 打印 shuffle 之后前 10 个 graph 的 y（若存在）
    first_10_y_after = []
    for item in all_list[:10]:
        g = _get_graph(item)
        first_10_y_after.append(_safe_y_str(g))
    print("first ten graphs' y after shuffle:", first_10_y_after)

    # 使用 torch.utils.data.random_split 划分（返回 Subset），然后转换回 list
    n = len(all_list)
    n_test = int(round(test_ratio * n))
    n_train = n - n_test
    if n_train <= 0 or n_test <= 0:
        raise ValueError(f"Dataset too small to split with test_ratio={test_ratio} (n={n})")

    generator = torch.Generator().manual_seed(42)  # 固定拆分的随机性（划分索引）
    subsets = random_split(all_list, [n_train, n_test], generator=generator)

    # random_split 返回的是 Subset（会对原始 dataset 做索引），直接把它转换为 list
    train_list = list(subsets[0])
    test_list = list(subsets[1])

    if return_graphs:
        train_graphs = [_get_graph(x) for x in train_list]
        test_graphs = [_get_graph(x) for x in test_list]
        return train_list, test_list, train_graphs, test_graphs

    return train_list, test_list
