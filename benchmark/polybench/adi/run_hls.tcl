open_project adi
add_files adi.c
set_top adi
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit