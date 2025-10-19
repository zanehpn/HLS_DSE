open_project dft_syn
add_files dft.c
set_top dft
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit