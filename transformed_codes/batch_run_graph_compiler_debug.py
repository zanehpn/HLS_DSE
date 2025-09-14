#!/usr/bin/env python3
"""
批量执行 run_graph_compiler.py：
- 遍历 transformed_codes/{bench}/{bench}_{number}.c
- 选取对应 top_list 中的 top 名称
- 如果输出目录下已有 .dot 文件则跳过
- 如果执行失败，打印 stdout 和 stderr
"""
import subprocess
import re
from pathlib import Path

bench_list = ['aes', 'bfs', 'fft', 'gemm', 'md', 'nw',
              'sort', 'spmv', 'stencil', 'viterbi']
top_map = {
    'aes': 'aes256_encrypt_ecb',
    'bfs': 'bfs',
    'fft': 'fft',
    'gemm': 'gemm',
    'md': 'md_kernel',
    'nw': 'needwun',
    'sort': 'ss_sort',
    'spmv': 'ellpack',
    'stencil': 'stencil3d',
    'viterbi': 'viterbi',
}

transformed_root = Path("/root/HLS_DSE/transformed_codes")
output_root = Path("/root/HLS_DSE/transformed_outputs")
graph_compiler = "/root/balor/graph_compiler/run_graph_compiler.py"

def main():
    pattern = re.compile(r"_(\d+)\.c$")
    total = skipped = executed = 0

    for bench in bench_list:
        bench_dir = transformed_root / bench
        if not bench_dir.is_dir():
            print(f"[WARN] missing dir: {bench_dir}")
            continue

        for src_file in bench_dir.glob(f"{bench}_*.c"):
            total += 1
            m = pattern.search(src_file.name)
            if not m:
                print(f"[WARN] bad name: {src_file}")
                continue

            number = m.group(1)
            top = top_map[bench]
            out_dir = output_root / bench / f"{bench}_{number}"

            if any(out_dir.glob("*.dot")):
                print(f"[SKIP] {src_file} (dot exists)")
                skipped += 1
                continue

            out_dir.mkdir(parents=True, exist_ok=True)

            cmd = [
                "python", graph_compiler,
                "--make_pdf", "--generalize_types", "--mode", "opt",
                "--src", str(src_file),
                "--top", top,
                "--outputFolder", str(out_dir)
            ]
            print(f"[RUN] {src_file} -> {out_dir}")

            # 捕获输出
            result = subprocess.run(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            if result.returncode == 0:
                executed += 1
            else:
                print(f"[ERROR] {src_file} failed with code {result.returncode}")
                print("----- STDOUT -----")
                print(result.stdout)
                print("----- STDERR -----")
                print(result.stderr)

    print(f"Total: {total}, Executed: {executed}, Skipped: {skipped}")

if __name__ == "__main__":
    main()
