open_project syr2k_syn
add_files syr2k.c
set_top syr2k
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit