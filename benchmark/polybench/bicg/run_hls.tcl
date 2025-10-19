open_project bicg_syn
add_files bicg.c
set_top bicg
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit