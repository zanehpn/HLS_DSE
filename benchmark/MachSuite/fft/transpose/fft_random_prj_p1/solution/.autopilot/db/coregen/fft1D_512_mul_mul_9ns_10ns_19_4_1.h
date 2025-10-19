// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __fft1D_512_mul_mul_9ns_10ns_19_4_1__HH__
#define __fft1D_512_mul_mul_9ns_10ns_19_4_1__HH__
#include "fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(fft1D_512_mul_mul_9ns_10ns_19_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0 fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U;

    SC_CTOR(fft1D_512_mul_mul_9ns_10ns_19_4_1):  fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U ("fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U") {
        fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U.clk(clk);
        fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U.rst(reset);
        fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U.ce(ce);
        fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U.a(din0);
        fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U.b(din1);
        fft1D_512_mul_mul_9ns_10ns_19_4_1_DSP48_0_U.p(dout);

    }

};

#endif //
