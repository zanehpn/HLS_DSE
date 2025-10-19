open_project merge_sort_parallel_syn
add_files merge_sort_parallel.c
set_top merge_sort_parallel
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit