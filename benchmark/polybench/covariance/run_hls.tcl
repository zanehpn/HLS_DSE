open_project covariance_syn
add_files covariance.c
set_top covariance
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit