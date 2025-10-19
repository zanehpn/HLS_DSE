open_project tsp_syn
add_files tsp.c
set_top tsp
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit