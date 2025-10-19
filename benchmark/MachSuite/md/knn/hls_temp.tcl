cd /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn
open_project prj
add_files md.c
add_files local_support.c
set_top md_kernel
open_solution -reset solution
set_part xc7vx485tffg1761-2
create_clock -period 10
source /home/zqy/DSE/HGBO-DSE/benchmark/MachSuite/md/knn/dir_test.tcl
csynth_design
exit
