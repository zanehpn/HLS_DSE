open_project sgd_syn
add_files sgd.cpp
set_top sgd
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit

