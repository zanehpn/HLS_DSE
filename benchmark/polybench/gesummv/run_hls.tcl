open_project gesummv_syn
add_files gesummv.c
set_top gesummv
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit