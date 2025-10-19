cd /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw
open_project prj
add_files nw.c
add_files local_support.c
set_top needwun
open_solution -reset solution
set_part xc7vx485tffg1761-2
create_clock -period 10
source /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/nw/nw/dir_test.tcl
csynth_design
exit
