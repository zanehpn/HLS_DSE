open_project atax_syn
add_files atax.c
set_top atax
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit