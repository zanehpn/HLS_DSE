open_project gemm_syn
add_files gemm.c
set_top gemm
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit