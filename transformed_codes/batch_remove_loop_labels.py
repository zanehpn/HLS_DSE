#!/usr/bin/env python3
"""
batch_remove_loop_labels.py

在指定目录下递归删除位于 for/while/do 控制语句之前的标签（例如 "ecb1 : for(...)" 或 "glog : do {"）。
默认直接覆盖原文件（按你的要求），但可以启用 --backup 来生成 .bak 备份。

用法示例：
  # 在 /home/zqy/HLS_DSE/transformed_codes 下递归处理所有 .c 文件，直接写回
  python3 batch_remove_loop_labels.py /home/zqy/HLS_DSE/transformed_codes

  # 测试模式（不写盘）
  python3 batch_remove_loop_labels.py /home/zqy/HLS_DSE/transformed_codes --dry-run

  # 保留标签为注释并创建备份
  python3 batch_remove_loop_labels.py /home/zqy/HLS_DSE/transformed_codes --comment --backup

参数:
  root_dir   必需，待处理的根目录
  --ext      以逗号分隔的扩展名列表（默认: c,cpp,h）
  --dry-run  不改文件，仅打印将被修改的文件
  --backup   为每个被修改的文件创建 .bak 备份（file.bak）
  --comment  将 label 替换为注释 /* label: name */ 而不是删除
  --jobs N   并行 worker 数（默认 1）
  --verbose  打印详细信息
"""
import argparse
import re
from pathlib import Path
import sys
import concurrent.futures
import shutil

# pattern: indent + label + ':' followed immediately by for|while|do (lookahead)
LABEL_BEFORE_LOOP_RE = re.compile(
    r'(^[ \t]*)'              # capture indentation
    r'([A-Za-z_]\w*)'         # label name
    r'\s*:\s*'                # colon with optional spaces
    r'(?=(for|while|do)\b)',  # lookahead for control keyword
    flags=re.MULTILINE
)

def process_file_text(text: str, to_comment: bool=False) -> (str, int):
    """
    返回 (new_text, num_replacements)
    - to_comment True: replace 'label :' with '/* label: name */' keeping indent
    - to_comment False: remove 'label :' leaving same indent
    """
    def repl(m: re.Match):
        indent = m.group(1) or ''
        label = m.group(2)
        if to_comment:
            return f"{indent}/* label: {label} */"
        else:
            return indent

    new_text, n = LABEL_BEFORE_LOOP_RE.subn(repl, text)
    return new_text, n

def process_file(path: Path, to_comment: bool=False, backup: bool=False, dry_run: bool=False, verbose: bool=False) -> (Path, int):
    """
    Process one file. Returns (path, num_replacements).
    If dry_run True, do not write any file.
    """
    try:
        orig_text = path.read_text(encoding='utf-8')
    except Exception as e:
        if verbose:
            print(f"[ERROR] Could not read {path}: {e}")
        return path, -1

    new_text, n = process_file_text(orig_text, to_comment=to_comment)
    if n == 0:
        if verbose:
            print(f"[SKIP] {path} (no labels found)")
        return path, 0

    if dry_run:
        print(f"[DRY] Would modify {path}: {n} replacement(s)")
        return path, n

    # write backup if requested
    if backup:
        bak = path.with_suffix(path.suffix + ".bak")
        try:
            shutil.copy2(path, bak)
        except Exception as e:
            print(f"[WARN] could not create backup for {path}: {e}")

    try:
        path.write_text(new_text, encoding='utf-8')
        if verbose:
            print(f"[OK] Modified {path}: {n} replacement(s)")
        return path, n
    except Exception as e:
        print(f"[ERROR] Could not write {path}: {e}")
        return path, -1

def iter_files(root: Path, exts):
    for p in root.rglob("*"):
        if p.is_file() and p.suffix.lower().lstrip('.') in exts:
            yield p

def main():
    p = argparse.ArgumentParser(description="Batch remove labels that precede for/while/do.")
    p.add_argument("root_dir", help="root directory to recursively process")
    p.add_argument("--ext", default="c,cpp,h", help="comma-separated extensions to process (default: c,cpp,h)")
    p.add_argument("--dry-run", action="store_true", help="don't modify files, only print actions")
    p.add_argument("--backup", action="store_true", help="create .bak backup for each modified file")
    p.add_argument("--comment", action="store_true", help="replace labels with comment /* label: name */ instead of deleting")
    p.add_argument("--jobs", type=int, default=1, help="number of parallel workers")
    p.add_argument("--verbose", action="store_true")
    args = p.parse_args()

    root = Path(args.root_dir)
    if not root.exists() or not root.is_dir():
        print(f"Error: root_dir not found or not a directory: {root}", file=sys.stderr)
        sys.exit(2)

    exts = [e.strip().lower() for e in args.ext.split(",") if e.strip()]
    files = list(iter_files(root, exts))
    if not files:
        print(f"No files with extensions {exts} found under {root}")
        return

    print(f"Found {len(files)} files. Processing with jobs={args.jobs} (dry_run={args.dry_run}, backup={args.backup}, comment={args.comment})")

    total_changed = 0
    failed = []

    if args.jobs <= 1:
        for f in files:
            _, n = process_file(f, to_comment=args.comment, backup=args.backup, dry_run=args.dry_run, verbose=args.verbose)
            if n is None:
                failed.append((f, "read/write error"))
            elif n > 0:
                total_changed += n
    else:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as ex:
            futs = {ex.submit(process_file, f, args.comment, args.backup, args.dry_run, args.verbose): f for f in files}
            for fut in concurrent.futures.as_completed(futs):
                f = futs[fut]
                try:
                    _, n = fut.result()
                    if n is None:
                        failed.append((f, "error"))
                    elif n > 0:
                        total_changed += n
                except Exception as e:
                    failed.append((f, str(e)))

    print(f"Done. Total replacements: {total_changed}. Files checked: {len(files)}. Failures: {len(failed)}")
    if failed:
        print("Failures:")
        for f, reason in failed:
            print(" -", f, reason)

if __name__ == "__main__":
    main()
