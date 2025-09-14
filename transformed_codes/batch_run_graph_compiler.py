#!/usr/bin/env python3
"""
batch_run_graph_compiler.py

批量运行 graph_compiler 的 wrapper。

示例单次命令（你给的）：
 python /root/balor/graph_compiler/run_graph_compiler.py --make_pdf --generalize_types \
   --mode opt --src /root/HLS_DSE/transformed_codes/aes/aes_number.c \
   --top aes256_encrypt_ecb --outputFolder /root/HLS_DSE/transformed_outputs/aes/aes_number/

本脚本会：
 - 遍历 bench_list 与 top_list（按 index zip）
 - 对每个 bench，遍历一系列 number（由 --numbers 指定或自动发现）
 - 构造 src = {transformed_base}/{bench}/{bench}_{number}.c
 - 构造 out = {output_base}/{bench}/{bench}_{number}/  （会自动 mkdir -p）
 - 执行命令： python {graph_compiler_py} --make_pdf --generalize_types --mode opt --src {src} --top {top} --outputFolder {out} [extra args]

功能：
  --jobs N        并行任务数（默认 1）
  --numbers S     逗号/范围 列表，例如 "1,2,5" 或 "1-10"；若不提供，脚本会自动在 transformed_base/{bench} 下查找 {bench}_*.c 并提取 number
  --graph-runner  run_graph_compiler.py 的绝对路径（默认 /root/balor/graph_compiler/run_graph_compiler.py）
  --transformed-base, --out-base 可覆盖默认路径
  --extra-args    传递给 graph_compiler 的额外参数（字符串，会拼接）
  --dry-run, --retry, --verbose
"""

import argparse
from pathlib import Path
import subprocess
import sys
import re
import concurrent.futures
import time
from typing import List, Tuple

# defaults (根据你提供的示例路径)
DEFAULT_GRAPH_RUNNER = "/root/balor/graph_compiler/run_graph_compiler.py"
DEFAULT_TRANSFORMED_BASE = "/root/HLS_DSE/transformed_codes"
DEFAULT_OUTPUT_BASE = "/root/HLS_DSE/transformed_outputs"

DEFAULT_BENCH_LIST = ['aes', 'bfs', 'fft', 'gemm', 'md', 'nw', 'sort', 'spmv', 'stencil', 'viterbi']
DEFAULT_TOP_LIST =   ['aes256_encrypt_ecb', 'bfs', 'fft', 'gemm', 'md_kernel', 'needwun',
                      'ss_sort', 'ellpack', 'stencil3d', 'viterbi']

FNAME_RE = re.compile(r'^(?P<bench>[A-Za-z0-9_]+)_(?P<num>\d+)\.c$')

def parse_numbers_spec(spec: str) -> List[str]:
    """
    支持 "1,2,5" 或 "1-10" 的格式
    返回字符串列表（保持原始数字字符串）
    """
    out = []
    for part in spec.split(','):
        part = part.strip()
        if not part:
            continue
        if '-' in part:
            a,b = part.split('-',1)
            a = int(a); b = int(b)
            out += [str(i) for i in range(a, b+1)]
        else:
            out.append(part)
    return out

def discover_numbers_for_bench(transformed_base: Path, bench: str) -> List[str]:
    """
    在 transformed_base/{bench} 目录下查找文件 {bench}_*.c ，提取数字并返回排序后的列表。
    若目录不存在或没有文件，返回空列表。
    """
    d = transformed_base / bench
    if not d.exists() or not d.is_dir():
        return []
    nums = set()
    for p in d.glob(f"{bench}_*.c"):
        m = FNAME_RE.match(p.name)
        if m:
            nums.add(m.group("num"))
    return sorted(nums, key=lambda x: int(x))

def build_cmd(graph_runner: str, src: Path, top: str, out_folder: Path, extra_args: str) -> List[str]:
    cmd = [sys.executable, graph_runner,
           "--make_pdf", "--generalize_types", "--mode", "opt",
           "--src", str(src),
           "--top", top,
           "--outputFolder", str(out_folder)]
    if extra_args:
        # split preserving quoted args
        import shlex
        cmd += shlex.split(extra_args)
    return cmd

def run_single(cmd: List[str], dry_run: bool=False, retry: int=1, verbose: bool=False) -> Tuple[int, str]:
    """
    返回 (returncode, stdout+stderr)
    """
    if verbose or dry_run:
        print("CMD:", " ".join(cmd))
    if dry_run:
        return 0, "DRY_RUN"
    attempt = 0
    last_out = ""
    while attempt < retry:
        attempt += 1
        try:
            proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, check=False)
            last_out = proc.stdout
            if proc.returncode == 0:
                return 0, last_out
            else:
                if verbose:
                    print(f"[attempt {attempt}/{retry}] rc={proc.returncode}")
                time.sleep(0.5)
        except Exception as e:
            last_out = str(e)
            if verbose:
                print("Exception:", e)
            time.sleep(0.5)
    return 1, last_out

def collect_jobs(transformed_base: Path, out_base: Path,
                 bench_list: List[str], top_list: List[str],
                 numbers_spec: str=None) -> List[Tuple[Path,str,Path,str]]:
    """
    返回 jobs 列表，每项是 (src_path, top, out_folder, number)
    """
    if len(bench_list) != len(top_list):
        raise ValueError("bench_list and top_list must be same length and zipped by index")

    jobs = []
    for bench, top in zip(bench_list, top_list):
        # determine numbers
        if numbers_spec:
            numbers = parse_numbers_spec(numbers_spec)
        else:
            numbers = discover_numbers_for_bench(transformed_base, bench)
        if not numbers:
            print(f"[WARN] no numbers found for bench {bench} under {transformed_base}/{bench}; skipping")
            continue
        for num in numbers:
            src = transformed_base / bench / f"{bench}_{num}.c"
            out_folder = out_base / bench / f"{bench}_{num}"
            jobs.append((src, top, out_folder, num))
    return jobs

def main():
    p = argparse.ArgumentParser(description="Batch run run_graph_compiler.py across benchmarks/numbers.")
    p.add_argument("--graph-runner", default=DEFAULT_GRAPH_RUNNER, help="path to run_graph_compiler.py")
    p.add_argument("--transformed-base", default=DEFAULT_TRANSFORMED_BASE, help="base dir where transformed_codes/{bench}/{bench}_{num}.c reside")
    p.add_argument("--out-base", default=DEFAULT_OUTPUT_BASE, help="base dir for outputs")
    p.add_argument("--benches", default=",".join(DEFAULT_BENCH_LIST), help="comma-separated bench list (zipped with tops)")
    p.add_argument("--tops", default=",".join(DEFAULT_TOP_LIST), help="comma-separated top list (zip with benches)")
    p.add_argument("--numbers", default=None, help="numbers spec: comma or ranges, e.g. '1,2,5' or '1-10'. If omitted, auto-discover files.")
    p.add_argument("--jobs", type=int, default=1, help="parallel jobs")
    p.add_argument("--dry-run", action="store_true")
    p.add_argument("--retry", type=int, default=1)
    p.add_argument("--extra-args", default="", help="extra args passed to run_graph_compiler.py (quoted)")
    p.add_argument("--verbose", action="store_true")
    args = p.parse_args()

    transformed_base = Path(args.transformed_base)
    out_base = Path(args.out_base)
    bench_list = [b.strip() for b in args.benches.split(",") if b.strip()]
    top_list = [t.strip() for t in args.tops.split(",") if t.strip()]

    jobs = collect_jobs(transformed_base, out_base, bench_list, top_list, numbers_spec=args.numbers)
    print(f"Collected {len(jobs)} jobs.")
    if not jobs:
        return

    results = []
    if args.jobs <= 1:
        for src, top, out_folder, num in jobs:
            out_folder.mkdir(parents=True, exist_ok=True)
            cmd = build_cmd(args.graph_runner, src, top, out_folder, args.extra_args)
            rc, out = run_single(cmd, dry_run=args.dry_run, retry=args.retry, verbose=args.verbose)
            results.append((src, top, out_folder, num, rc, out))
    else:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as ex:
            futs = []
            for src, top, out_folder, num in jobs:
                out_folder.mkdir(parents=True, exist_ok=True)
                cmd = build_cmd(args.graph_runner, src, top, out_folder, args.extra_args)
                futs.append(ex.submit(run_single, cmd, args.dry_run, args.retry, args.verbose))
            # gather
            for (src, top, out_folder, num), fut in zip(jobs, concurrent.futures.as_completed(futs)):
                rc, out = fut.result()
                results.append((src, top, out_folder, num, rc, out))

    # summary
    fails = [r for r in results if r[4] != 0]
    print("==== SUMMARY ====")
    print(f"Total: {len(results)}, Success: {len(results)-len(fails)}, Failures: {len(fails)}")
    if fails:
        for src, top, out_folder, num, rc, out in fails:
            print(f"- FAIL: bench={src.parent.name} num={num} top={top} rc={rc}")
            if out:
                print("  last output tail:")
                print("\n".join(out.splitlines()[-30:]))
    else:
        print("All succeeded.")

if __name__ == "__main__":
    main()
