open_project mvt_syn
add_files mvt.c
set_top mvt
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit