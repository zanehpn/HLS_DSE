open_project compute_attention_HLS_syn
add_files compute_attention_HLS.c
set_top compute_attention_HLS
open_solution -reset solution
create_clock -period 10 -name default
set_part {virtex7}
csynth_design
exit