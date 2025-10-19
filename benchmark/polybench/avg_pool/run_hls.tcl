open_project avg_pool_syn
add_files avg_pool.c
set_top avg_pool
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit