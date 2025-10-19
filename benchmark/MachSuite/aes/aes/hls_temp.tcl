cd /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes
open_project prj
add_files aes.c
add_files local_support.c
set_top aes256_encrypt_ecb
open_solution -reset solution
set_part xc7vx485tffg1761-2
create_clock -period 10
source /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/aes/aes/dir_test.tcl
csynth_design
exit
