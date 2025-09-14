/*
Based on algorithm described here:
http://www.cs.berkeley.edu/~mhoemmen/matrix-seminar/slides/UCB_sparse_tutorial_1.pdf
*/

#include "spmv.h"

void ellpack(TYPE nzval[N*L], int32_t cols[N*L], TYPE vec[N], TYPE out[N])
{
#pragma HLS array_reshape variable=vec type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic ellpack vec
#pragma HLS array_partition variable=vec type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block ellpack vec
#pragma HLS array_partition variable=cols type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic ellpack cols
#pragma HLS array_reshape variable=nzval type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block ellpack nzval
    int i, j;
    TYPE Si;

    ellpack_1 : for (i=0; i<N; i++) {
#pragma HLS bind_op variable=i op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 ellpack/ellpack_1 i
// set_directive_bind_op -op add -impl dsp -latency -1 ellpack/ellpack_1 i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off ellpack/ellpack_1
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 ellpack/ellpack_1
        TYPE sum = out[i];
#pragma HLS bind_op variable=sum op=dadd impl=fabric latency=True  // set_directive_bind_op -op dadd -impl fabric -latency -1 ellpack/ellpack_2 sum
// set_directive_bind_op -op dadd -impl fabric -latency -1 ellpack/ellpack_2 sum  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
        ellpack_2 : for (j=0; j<L; j++) {
#pragma HLS bind_op variable=j op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 ellpack/ellpack_2 j
// set_directive_bind_op -op add -impl fabric -latency -1 ellpack/ellpack_2 j  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp ellpack/ellpack_2
                Si = nzval[j + i*L] * vec[cols[j + i*L]];
                sum += Si;
#pragma HLS bind_op variable=Si op=dmul impl=fulldsp latency=True  // set_directive_bind_op -op dmul -impl fulldsp -latency -1 ellpack/ellpack_2 Si
// set_directive_bind_op -op dmul -impl fulldsp -latency -1 ellpack/ellpack_2 Si  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
        }
        out[i] = sum;
    }
}
