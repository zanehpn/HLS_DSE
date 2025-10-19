open_project fdtd_2d_syn
add_files fdtd_2d.c
set_top fdtd_2d
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit