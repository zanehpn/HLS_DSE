cd /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided
open_project prj
add_files fft.c
add_files local_support.c
set_top fft
open_solution -reset solution
set_part xc7vx485tffg1761-2
create_clock -period 10
source /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/fft/strided/dir_test.tcl
csynth_design
exit
