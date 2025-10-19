open_project correlation_syn
add_files correlation.c
set_top correlation
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit