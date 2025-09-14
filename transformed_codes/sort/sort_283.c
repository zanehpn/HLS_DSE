/*
Implementation based on algorithm described in:
A. Danalis, G. Marin, C. McCurdy, J. S. Meredith, P. C. Roth, K. Spafford, V. Tipparaju, and J. S. Vetter.
The scalable heterogeneous computing (shoc) benchmark suite.
In Proceedings of the 3rd Workshop on General-Purpose Computation on Graphics Processing Units, 2010
*/

#include "sort.h"

void local_scan(int bucket[BUCKETSIZE])
{
#pragma HLS inline recursive  // set_directive_inline -recursive local_scan
    int radixID, i, bucket_indx;
// set_directive_bind_op -op mul -impl dsp -latency -1 local_scan/local_2 bucket_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    local_1 : for (radixID=0; radixID<SCAN_RADIX; radixID++) {
// set_directive_bind_op -op add -impl fabric -latency -1 local_scan/local_1 radixID  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off local_scan/local_1
// set_directive_loop_flatten -off local_scan/local_1  // (no mapping available)
        local_2 : for (i=1; i<SCAN_BLOCK; i++){
// set_directive_bind_op -op add -impl fabric -latency -1 local_scan/local_2 i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp local_scan/local_2
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 local_scan/local_2
            bucket_indx = radixID*SCAN_BLOCK + i;
            bucket[bucket_indx] += bucket[bucket_indx-1];
        }
    }
}

void sum_scan(int sum[SCAN_RADIX], int bucket[BUCKETSIZE])
{
#pragma HLS inline on// set_directive_inline sum_scan
    int radixID, bucket_indx;
// set_directive_bind_op -op mul -impl dsp -latency -1 sum_scan/sum_1 bucket_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    sum[0] = 0;
    sum_1 : for (radixID=1; radixID<SCAN_RADIX; radixID++) {
// set_directive_bind_op -op add -impl dsp -latency -1 sum_scan/sum_1 radixID  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off sum_scan/sum_1
        bucket_indx = radixID*SCAN_BLOCK - 1;
        sum[radixID] = sum[radixID-1] + bucket[bucket_indx];
    }
}

void last_step_scan(int bucket[BUCKETSIZE], int sum[SCAN_RADIX])
{
#pragma HLS inline recursive  // set_directive_inline -recursive last_step_scan
    int radixID, i, bucket_indx;
// set_directive_bind_op -op mul -impl dsp -latency -1 last_step_scan/last_2 bucket_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    last_1:for (radixID=0; radixID<SCAN_RADIX; radixID++) {
#pragma HLS bind_op variable=radixID op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 last_step_scan/last_1 radixID
// set_directive_bind_op -op add -impl fabric -latency -1 last_step_scan/last_1 radixID  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off last_step_scan/last_1
// set_directive_loop_flatten -off last_step_scan/last_1  // (no mapping available)
        last_2:for (i=0; i<SCAN_BLOCK; i++) {
// set_directive_bind_op -op add -impl fabric -latency -1 last_step_scan/last_2 i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off last_step_scan/last_2
            bucket_indx = radixID * SCAN_BLOCK + i;
            bucket[bucket_indx] = bucket[bucket_indx] + sum[radixID];
         }
    }
}

void init(int bucket[BUCKETSIZE])
{
#pragma HLS inline on// set_directive_inline init
    int i;
    init_1 : for (i=0; i<BUCKETSIZE; i++) {
// set_directive_bind_op -op add -impl dsp -latency -1 init/init_1 i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp init/init_1
        bucket[i] = 0;
    }
}

void hist(int bucket[BUCKETSIZE], int a[SIZE], int exp)
{
#pragma HLS inline off  // set_directive_inline -off hist
    int blockID, i, bucket_indx, a_indx;
// set_directive_bind_op -op mul -impl dsp -latency -1 hist/hist_2 a_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
// set_directive_bind_op -op mul -impl dsp -latency -1 hist/hist_2 bucket_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    blockID = 0;
    hist_1 : for (blockID=0; blockID<NUMOFBLOCKS; blockID++) {
// set_directive_bind_op -op add -impl dsp -latency -1 hist/hist_1 blockID  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
// set_directive_loop_flatten hist/hist_1  // (no mapping available)
        hist_2 : for(i=0; i<4; i++) {
// set_directive_bind_op -op add -impl fabric -latency -1 hist/hist_2 i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off hist/hist_2
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 hist/hist_2
            a_indx = blockID * ELEMENTSPERBLOCK + i;
            bucket_indx = ((a[a_indx] >> exp) & 0x3)*NUMOFBLOCKS + blockID + 1;
            bucket[bucket_indx]++;
        }
    }
}

void update(int b[SIZE], int bucket[BUCKETSIZE], int a[SIZE], int exp)
{
#pragma HLS inline off  // set_directive_inline -off update
    int i, blockID, bucket_indx, a_indx;
#pragma HLS bind_op variable=a_indx op=mul impl=fabric latency=True  // set_directive_bind_op -op mul -impl fabric -latency -1 update/update_2 a_indx
// set_directive_bind_op -op mul -impl fabric -latency -1 update/update_2 a_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=bucket_indx op=mul impl=dsp latency=True  // set_directive_bind_op -op mul -impl dsp -latency -1 update/update_2 bucket_indx
// set_directive_bind_op -op mul -impl dsp -latency -1 update/update_2 bucket_indx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    blockID = 0;

    update_1 : for (blockID = 0; blockID < NUMOFBLOCKS; blockID++) {
#pragma HLS bind_op variable=blockID op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 update/update_1 blockID
// set_directive_bind_op -op add -impl fabric -latency -1 update/update_1 blockID  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp update/update_1
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 update/update_1
// set_directive_loop_flatten -off update/update_1  // (no mapping available)
        update_2 : for(i=0; i<4; i++) {
#pragma HLS bind_op variable=i op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 update/update_2 i
// set_directive_bind_op -op add -impl fabric -latency -1 update/update_2 i  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
            bucket_indx = ((a[blockID * ELEMENTSPERBLOCK + i] >> exp) & 0x3)*NUMOFBLOCKS + blockID;
            a_indx = blockID * ELEMENTSPERBLOCK + i;
            b[bucket[bucket_indx]] = a[a_indx];
            bucket[bucket_indx]++;
        }
    }
}

void ss_sort(int a[SIZE], int b[SIZE], int bucket[BUCKETSIZE], int sum[SCAN_RADIX]){
#pragma HLS array_reshape variable=sum type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block ss_sort sum
#pragma HLS array_partition variable=sum type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block ss_sort sum
#pragma HLS array_reshape variable=bucket type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic ss_sort bucket
#pragma HLS array_reshape variable=b type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block ss_sort b
#pragma HLS array_partition variable=b type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic ss_sort b
#pragma HLS array_reshape variable=a type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic ss_sort a
#pragma HLS array_partition variable=a type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block ss_sort a
    int exp=0;
    int valid_buffer=0;
    #define BUFFER_A 0
    #define BUFFER_B 1

    sort_1 : for (exp=0; exp<32; exp+=2) {
#pragma HLS bind_op variable=exp op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 ss_sort/sort_1 exp
// set_directive_bind_op -op add -impl fabric -latency -1 ss_sort/sort_1 exp  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 ss_sort/sort_1
        init(bucket);
        if (valid_buffer == BUFFER_A) {
            hist(bucket, a, exp);
        } else {
            hist(bucket, b, exp);
        }

        local_scan(bucket);
        sum_scan(sum, bucket);
        last_step_scan(bucket, sum);

        if (valid_buffer==BUFFER_A) {
            update(b, bucket, a, exp);
            valid_buffer = BUFFER_B;
        } else {
            update(a, bucket, b, exp);
            valid_buffer = BUFFER_A;
        }
    }
    // If trip count is even, buffer A will be valid at the end.
}
