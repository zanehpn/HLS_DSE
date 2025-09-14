#include "fft.h"

void fft(double real[FFT_SIZE], double img[FFT_SIZE], double real_twid[FFT_SIZE/2], double img_twid[FFT_SIZE/2]){
#pragma HLS array_reshape variable=img_twid type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic fft img_twid
#pragma HLS array_reshape variable=real_twid type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block fft real_twid
#pragma HLS array_partition variable=real_twid type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block fft real_twid
    int even, odd, span, log, rootindex;
    double temp;
    log = 0;

    outer:for(span=FFT_SIZE>>1; span; span>>=1, log++){
#pragma HLS bind_op variable=log op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 fft/outer log
// set_directive_bind_op -op add -impl dsp -latency -1 fft/outer log  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off fft/outer
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 fft/outer
        inner:for(odd=span; odd<FFT_SIZE; odd++){
#pragma HLS bind_op variable=odd op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 fft/inner odd
// set_directive_bind_op -op add -impl dsp -latency -1 fft/inner odd  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp fft/inner
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 fft/inner
            odd |= span;
            even = odd ^ span;

            temp = real[even] + real[odd];
            real[odd] = real[even] - real[odd];
            real[even] = temp;
#pragma HLS bind_op variable=temp op=dmul impl=fabric latency=True  // set_directive_bind_op -op dmul -impl fabric -latency -1 fft/inner temp
// set_directive_bind_op -op dmul -impl fabric -latency -1 fft/inner temp  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=temp op=dadd impl=fulldsp latency=True  // set_directive_bind_op -op dadd -impl fulldsp -latency -1 fft/inner temp
// set_directive_bind_op -op dadd -impl fulldsp -latency -1 fft/inner temp  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)

            temp = img[even] + img[odd];
            img[odd] = img[even] - img[odd];
            img[even] = temp;

            rootindex = (even<<log) & (FFT_SIZE - 1);
            if(rootindex){
                temp = real_twid[rootindex] * real[odd] -
                    img_twid[rootindex]  * img[odd];
                img[odd] = real_twid[rootindex]*img[odd] +
                    img_twid[rootindex]*real[odd];
                real[odd] = temp;
            }
        }
    }
}
