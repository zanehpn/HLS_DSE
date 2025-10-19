open_project durbin_syn
add_files durbin.c
set_top durbin
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit