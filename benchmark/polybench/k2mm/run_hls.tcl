open_project k2mm_syn
add_files k2mm.c
set_top k2mm
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit