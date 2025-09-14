#include "nw.h"

#define MATCH_SCORE 1
#define MISMATCH_SCORE -1
#define GAP_SCORE -1

#define ALIGN '\\'
#define SKIPA '^'
#define SKIPB '<'

#define MAX(A,B) ( ((A)>(B))?(A):(B) )

void needwun(char SEQA[ALEN], char SEQB[BLEN],
             char alignedA[ALEN+BLEN], char alignedB[ALEN+BLEN],
             int M[(ALEN+1)*(BLEN+1)], char ptr[(ALEN+1)*(BLEN+1)]){
#pragma HLS array_reshape variable=ptr type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block needwun ptr
#pragma HLS array_partition variable=ptr type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic needwun ptr
#pragma HLS array_reshape variable=allignedB type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic needwun allignedB
#pragma HLS array_reshape variable=allignedA type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic needwun allignedA
#pragma HLS array_partition variable=allignedA type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic needwun allignedA
#pragma HLS array_reshape variable=SEQB type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic needwun SEQB
#pragma HLS array_partition variable=SEQB type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block needwun SEQB
#pragma HLS array_reshape variable=SEQA type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic needwun SEQA

    int score, up_left, up, left, max;
#pragma HLS bind_op variable=left op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 needwun/fill_in left
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/fill_in left  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=up op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 needwun/fill_in up
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/fill_in up  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=up_left op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 needwun/fill_in up_left
// set_directive_bind_op -op add -impl dsp -latency -1 needwun/fill_in up_left  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    int row, row_up, r;
#pragma HLS bind_op variable=row op=mul impl=fabric latency=True  // set_directive_bind_op -op mul -impl fabric -latency -1 needwun/fill_in row
// set_directive_bind_op -op mul -impl fabric -latency -1 needwun/fill_in row  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=row_up op=mul impl=dsp latency=True  // set_directive_bind_op -op mul -impl dsp -latency -1 needwun/fill_in row_up
// set_directive_bind_op -op mul -impl dsp -latency -1 needwun/fill_in row_up  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    int a_idx, b_idx;
    int a_str_idx, b_str_idx;
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/trace b_str_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
// set_directive_bind_op -op add -impl dsp -latency -1 needwun/trace a_str_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)

    for(a_idx=0; a_idx<(ALEN+1); a_idx++){
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/init_row a_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp needwun/init_row
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 needwun/init_row
        M[a_idx] = a_idx * GAP_SCORE;
    }
    for(b_idx=0; b_idx<(BLEN+1); b_idx++){
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/init_col b_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp needwun/init_col
        M[b_idx*(ALEN+1)] = b_idx * GAP_SCORE;
    }

    // Matrix filling loop
    for(b_idx=1; b_idx<(BLEN+1); b_idx++){
#pragma HLS bind_op variable=b_idx op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 needwun/fill_out b_idx
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/fill_out b_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
        for(a_idx=1; a_idx<(ALEN+1); a_idx++){
#pragma HLS bind_op variable=a_idx op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 needwun/fill_in a_idx
// set_directive_bind_op -op add -impl dsp -latency -1 needwun/fill_in a_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp needwun/fill_in
            if(SEQA[a_idx-1] == SEQB[b_idx-1]){
                score = MATCH_SCORE;
            } else {
                score = MISMATCH_SCORE;
            }

            row_up = (b_idx-1)*(ALEN+1);
            row = (b_idx)*(ALEN+1);

            up_left = M[row_up + (a_idx-1)] + score;
            up      = M[row_up + (a_idx  )] + GAP_SCORE;
            left    = M[row    + (a_idx-1)] + GAP_SCORE;

            max = MAX(up_left, MAX(up, left));

            M[row + a_idx] = max;
            if(max == left){
                ptr[row + a_idx] = SKIPB;
            } else if(max == up){
                ptr[row + a_idx] = SKIPA;
            } else{
                ptr[row + a_idx] = ALIGN;
            }
        }
    }

    // TraceBack (n.b. aligned sequences are backwards to avoid string appending)
    a_idx = ALEN;
    b_idx = BLEN;
    a_str_idx = 0;
    b_str_idx = 0;

    while(a_idx>0 || b_idx>0) {
#pragma HLS bind_op variable=b_idx op=sub impl=fabric latency=True  // set_directive_bind_op -op sub -impl fabric -latency -1 needwun/trace b_idx
// set_directive_bind_op -op sub -impl fabric -latency -1 needwun/trace b_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=a_idx op=sub impl=dsp latency=True  // set_directive_bind_op -op sub -impl dsp -latency -1 needwun/trace a_idx
// set_directive_bind_op -op sub -impl dsp -latency -1 needwun/trace a_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off needwun/trace
        r = b_idx*(ALEN+1);
        if (ptr[r + a_idx] == ALIGN){
#pragma HLS bind_op variable=r op=mul impl=fabric latency=True  // set_directive_bind_op -op mul -impl fabric -latency -1 needwun/trace r
// set_directive_bind_op -op mul -impl fabric -latency -1 needwun/trace r  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
            alignedA[a_str_idx++] = SEQA[a_idx-1];
            alignedB[b_str_idx++] = SEQB[b_idx-1];
            a_idx--;
            b_idx--;
        }
        else if (ptr[r + a_idx] == SKIPB){
            alignedA[a_str_idx++] = SEQA[a_idx-1];
            alignedB[b_str_idx++] = '-';
            a_idx--;
        }
        else{ // SKIPA
            alignedA[a_str_idx++] = '-';
            alignedB[b_str_idx++] = SEQB[b_idx-1];
            b_idx--;
        }
    }

    // Pad the result
    for( ; a_str_idx<ALEN+BLEN; a_str_idx++ ) {
#pragma HLS bind_op variable=a_str_idx op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 needwun/pad_a a_str_idx
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/pad_a a_str_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off needwun/pad_a
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 needwun/pad_a
      alignedA[a_str_idx] = '_';
    }
    for( ; b_str_idx<ALEN+BLEN; b_str_idx++ ) {
#pragma HLS bind_op variable=b_str_idx op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 needwun/pad_b b_str_idx
// set_directive_bind_op -op add -impl fabric -latency -1 needwun/pad_b b_str_idx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp needwun/pad_b
      alignedB[b_str_idx] = '_';
    }
}
