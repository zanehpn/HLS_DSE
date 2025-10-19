open_project digit_syn
add_files digit.c
set_top digit
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit