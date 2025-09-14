/*
Implementation based on algorithm described in:
"Stencil computation optimization and auto-tuning on state-of-the-art multicore architectures"
K. Datta, M. Murphy, V. Volkov, S. Williams, J. Carter, L. Oliker, D. Patterson, J. Shalf, K. Yelick
SC 2008
*/

#include "stencil.h"

void stencil3d(TYPE C[2], TYPE orig[SIZE], TYPE sol[SIZE]) {
#pragma HLS array_partition variable=sol type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic stencil3d sol
#pragma HLS array_reshape variable=orig type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block stencil3d orig
#pragma HLS array_partition variable=orig type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic stencil3d orig
    int i, j, k;
    TYPE sum0, sum1, mul0, mul1;
#pragma HLS bind_op variable=mul0 op=mul impl=fabric latency=True  // set_directive_bind_op -op mul -impl fabric -latency -1 stencil3d/loop_row mul0
// set_directive_bind_op -op mul -impl fabric -latency -1 stencil3d/loop_row mul0  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=sum1 op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 stencil3d/loop_row sum1
// set_directive_bind_op -op add -impl dsp -latency -1 stencil3d/loop_row sum1  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)

    // Handle boundary conditions by filling with original values
    for(j=0; j<col_size; j++) {
// set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/height_bound_col j  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp stencil3d/height_bound_col
// set_directive_loop_flatten -off stencil3d/height_bound_col  // (no mapping available)
        for(k=0; k<row_size; k++) {
// set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/height_bound_row k  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
            sol[INDX(row_size, col_size, k, j, 0)] = orig[INDX(row_size, col_size, k, j, 0)];
            sol[INDX(row_size, col_size, k, j, height_size-1)] = orig[INDX(row_size, col_size, k, j, height_size-1)];
        }
    }
    for(i=1; i<height_size-1; i++) {
// set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/col_bound_height i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
// set_directive_loop_flatten stencil3d/col_bound_height  // (no mapping available)
        for(k=0; k<row_size; k++) {
// set_directive_bind_op -op add -impl dsp -latency -1 stencil3d/col_bound_row k  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp stencil3d/col_bound_row
            sol[INDX(row_size, col_size, k, 0, i)] = orig[INDX(row_size, col_size, k, 0, i)];
            sol[INDX(row_size, col_size, k, col_size-1, i)] = orig[INDX(row_size, col_size, k, col_size-1, i)];
        }
    }
    for(i=1; i<height_size-1; i++) {
// set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/row_bound_height i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
// set_directive_loop_flatten stencil3d/row_bound_height  // (no mapping available)
        for(j=1; j<col_size-1; j++) {
// set_directive_bind_op -op add -impl dsp -latency -1 stencil3d/row_bound_col j  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp stencil3d/row_bound_col
            sol[INDX(row_size, col_size, 0, j, i)] = orig[INDX(row_size, col_size, 0, j, i)];
            sol[INDX(row_size, col_size, row_size-1, j, i)] = orig[INDX(row_size, col_size, row_size-1, j, i)];
        }
    }


    // Stencil computation
    for(i = 1; i < height_size - 1; i++){
#pragma HLS bind_op variable=i op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/loop_height i
// set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/loop_height i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 stencil3d/loop_height
// set_directive_loop_flatten -off stencil3d/loop_height  // (no mapping available)
        for(j = 1; j < col_size - 1; j++){
#pragma HLS bind_op variable=j op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 stencil3d/loop_col j
// set_directive_bind_op -op add -impl dsp -latency -1 stencil3d/loop_col j  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp stencil3d/loop_col
// set_directive_loop_flatten -off stencil3d/loop_col  // (no mapping available)
            for(k = 1; k < row_size - 1; k++){
#pragma HLS bind_op variable=k op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/loop_row k
// set_directive_bind_op -op add -impl fabric -latency -1 stencil3d/loop_row k  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
                sum0 = orig[INDX(row_size, col_size, k, j, i)];
                sum1 = orig[INDX(row_size, col_size, k, j, i + 1)] +
                       orig[INDX(row_size, col_size, k, j, i - 1)] +
                       orig[INDX(row_size, col_size, k, j + 1, i)] +
                       orig[INDX(row_size, col_size, k, j - 1, i)] +
                       orig[INDX(row_size, col_size, k + 1, j, i)] +
                       orig[INDX(row_size, col_size, k - 1, j, i)];
                mul0 = sum0 * C[0];
                mul1 = sum1 * C[1];
                sol[INDX(row_size, col_size, k, j, i)] = mul0 + mul1;
#pragma HLS bind_op variable=mul1 op=mul impl=dsp latency=True  // set_directive_bind_op -op mul -impl dsp -latency -1 stencil3d/loop_row mul1
// set_directive_bind_op -op mul -impl dsp -latency -1 stencil3d/loop_row mul1  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
            }
        }
    }
}
