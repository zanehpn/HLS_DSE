open_project syrk_syn
add_files syrk.c
set_top syrk
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit