#!/usr/bin/env python3
"""
remove_specific_loops_fixed.py

修正版：递归处理目录下所有 .c 文件，删除以下两类 for-loop：
  for( ; a_str_idx<ALEN+BLEN; a_str_idx++ ) { ... }
  for( ; b_str_idx<ALEN+BLEN; b_str_idx++ ) { ... }

避免使用 str.format() 导致的花括号转义问题（已修复）。
"""
import argparse
from pathlib import Path
import re
import shutil
import sys

# We will build regex by concatenation to avoid format() brace issues.
# Regex to match for(...) { where inside parentheses contains the target var and ALEN+BLEN
def make_for_pattern(var_name: str):
    # allow arbitrary spaces and other tokens inside the parentheses,
    # require var_name somewhere and ALEN + BLEN somewhere
    # finally require the opening brace '{' (possibly with spaces before it)
    part = (
        r'for'                       # for
        r'\s*\('                     # optional spaces then '('
        r'[^)]*'                     # any chars except ')' (the whole paren content)
    )
    # We'll use a positive lookahead approach: ensure var_name and ALEN+BLEN appear inside parentheses.
    # Build pattern that finds 'for(' then uses lookahead assertions for var and ALEN+BLEN, then consumes up to '{'
    pat = (
        r'for' +
        r'\s*\(' +
        r'(?=[^)]*' + re.escape(var_name) + r')' +   # lookahead: var_name inside parens
        r'(?=[^)]*ALEN\s*\+\s*BLEN)' +              # lookahead: ALEN + BLEN inside parens
        r'[^)]*\)\s*\{'                              # consume until ')' then optional spaces and '{'
    )
    return re.compile(pat, flags=re.IGNORECASE | re.MULTILINE)

def find_matching_brace(text: str, start_pos: int) -> int:
    """
    Given index of '{' (start_pos), find index of matching '}'.
    Returns index of the '}' (inclusive). If not found, returns -1.
    """
    depth = 0
    i = start_pos
    L = len(text)
    while i < L:
        ch = text[i]
        if ch == '{':
            depth += 1
        elif ch == '}':
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return -1

def collect_loops_to_remove(text: str):
    """
    Find all occurrences of the two loop headers and return list of (start_idx, end_idx) ranges to remove.
    We search for both 'a_str_idx' and 'b_str_idx' variants.
    """
    ranges = []
    for var in ('a_str_idx', 'b_str_idx'):
        pat = make_for_pattern(var)
        for m in pat.finditer(text):
            # find the '{' corresponding to this match: the match ends right after '{'
            # but to be robust, search for the first '{' at or after m.start()
            open_brace_pos = text.find('{', m.start())
            if open_brace_pos == -1:
                continue
            close_pos = find_matching_brace(text, open_brace_pos)
            if close_pos == -1:
                # unmatched brace; skip this match for safety
                continue
            # include the whole line where 'for' starts: move left to previous newline+1
            line_start = text.rfind('\n', 0, m.start())
            left = line_start + 1 if line_start != -1 else 0
            # also trim trailing whitespace/newlines after the closing brace (one newline)
            right = close_pos + 1
            # include any following whitespace/newlines up to next non-newline (to avoid leftover blank lines)
            while right < len(text) and text[right] in ' \t\r\n':
                right += 1
            ranges.append((left, right))
    # Merge overlapping or adjacent ranges and sort descending by start
    if not ranges:
        return []
    ranges = sorted(ranges, key=lambda x: (x[0], x[1]))
    merged = []
    cur_s, cur_e = ranges[0]
    for s,e in ranges[1:]:
        if s <= cur_e:  # overlap or contiguous
            cur_e = max(cur_e, e)
        else:
            merged.append((cur_s, cur_e))
            cur_s, cur_e = s, e
    merged.append((cur_s, cur_e))
    # return in reverse order (so removal won't shift earlier indices)
    merged.sort(reverse=True, key=lambda x: x[0])
    return merged

def process_file(path: Path, backup: bool=False, dry_run: bool=False, verbose: bool=False):
    text = path.read_text(encoding='utf-8')
    ranges = collect_loops_to_remove(text)
    if not ranges:
        if verbose:
            print(f"[SKIP] {path} (no target loops found)")
        return 0
    if dry_run:
        print(f"[DRY] Would remove {len(ranges)} loop block(s) in {path}")
        print(" Ranges to remove (start_idx, end_idx):", ranges)
        return len(ranges)
    # backup
    if backup:
        bak = path.with_suffix(path.suffix + ".bak")
        shutil.copy2(path, bak)
    new_text = text
    removed_count = 0
    for s, e in ranges:
        new_text = new_text[:s] + new_text[e:]
        removed_count += 1
    # collapse multiple blank lines
    new_text = re.sub(r'\n{3,}', '\n\n', new_text)
    path.write_text(new_text, encoding='utf-8')
    print(f"[OK] Modified {path}: removed {removed_count} loop block(s)")
    return removed_count

def main():
    p = argparse.ArgumentParser(description="Remove specific for-loops with a_str_idx/b_str_idx < ALEN+BLEN under a dir")
    p.add_argument("root", help="root directory to process (will search recursively for .c files)")
    p.add_argument("--backup", action="store_true", help="create .bak backup for each modified file")
    p.add_argument("--dry-run", action="store_true", help="do not modify files, only report")
    p.add_argument("--ext", default="c", help="comma-separated extensions to process (default: c)")
    p.add_argument("--verbose", action="store_true")
    args = p.parse_args()

    root = Path(args.root)
    if not root.exists() or not root.is_dir():
        print("Error: root must be an existing directory", file=sys.stderr)
        sys.exit(2)

    exts = [e.strip().lower() for e in args.ext.split(",") if e.strip()]
    files = list(root.rglob("*"))
    files = [f for f in files if f.is_file() and f.suffix.lower().lstrip('.') in exts]

    total_removed = 0
    files_modified = 0
    for f in files:
        try:
            n = process_file(f, backup=args.backup, dry_run=args.dry_run, verbose=args.verbose)
            if n > 0:
                total_removed += n
                files_modified += 1
        except Exception as e:
            print(f"[ERROR] processing {f}: {e}")

    print(f"Done. Files scanned: {len(files)}. Files modified: {files_modified}. Total loops removed: {total_removed}")

if __name__ == "__main__":
    main()
