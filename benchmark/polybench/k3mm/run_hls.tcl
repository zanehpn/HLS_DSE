open_project k3mm_syn
add_files k3mm.c
set_top k3mm
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit