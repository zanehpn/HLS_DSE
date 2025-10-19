open_project doitgen_syn
add_files doitgen.c
set_top doitgen
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit