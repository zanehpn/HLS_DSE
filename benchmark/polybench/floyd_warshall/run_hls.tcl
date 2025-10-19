open_project floyd_warshall_syn
add_files floyd_warshall.c
set_top floyd_warshall
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit