#include "gemm.h"

void gemm( TYPE m1[N], TYPE m2[N], TYPE prod[N] ){
#pragma HLS array_reshape variable=prod type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic gemm prod
#pragma HLS array_reshape variable=m1 type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic gemm m1
    int i, j, k;
    int k_col, i_col;
#pragma HLS bind_op variable=i_col op=mul impl=dsp latency=True  // set_directive_bind_op -op mul -impl dsp -latency -1 gemm/middle i_col
// set_directive_bind_op -op mul -impl dsp -latency -1 gemm/middle i_col  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    TYPE mult;

    for(i=0;i<row_size;i++) {
#pragma HLS bind_op variable=i op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 gemm/outer i
// set_directive_bind_op -op add -impl dsp -latency -1 gemm/outer i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
// set_directive_loop_flatten -off gemm/outer  // (no mapping available)
        for(j=0;j<col_size;j++) {
#pragma HLS bind_op variable=j op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 gemm/middle j
// set_directive_bind_op -op add -impl fabric -latency -1 gemm/middle j  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off gemm/middle
            i_col = i * col_size;
            TYPE sum = 0;
#pragma HLS bind_op variable=sum op=dadd impl=fabric latency=True  // set_directive_bind_op -op dadd -impl fabric -latency -1 gemm/inner sum
// set_directive_bind_op -op dadd -impl fabric -latency -1 gemm/inner sum  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
            for(k=0;k<row_size;k++) {
#pragma HLS bind_op variable=k op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 gemm/inner k
// set_directive_bind_op -op add -impl fabric -latency -1 gemm/inner k  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off gemm/inner
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 gemm/inner
                k_col = k * col_size;
                mult = m1[i_col + k] * m2[k_col + j];
#pragma HLS bind_op variable=k_col op=mul impl=fabric latency=True  // set_directive_bind_op -op mul -impl fabric -latency -1 gemm/inner k_col
// set_directive_bind_op -op mul -impl fabric -latency -1 gemm/inner k_col  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
                sum += mult;
#pragma HLS bind_op variable=mult op=dmul impl=fulldsp latency=True  // set_directive_bind_op -op dmul -impl fulldsp -latency -1 gemm/inner mult
// set_directive_bind_op -op dmul -impl fulldsp -latency -1 gemm/inner mult  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
            }
            prod[i_col + j]  = sum;
        }
    }
}
