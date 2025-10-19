// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __stencil3d_add_32ns_32ns_32_1_1__HH__
#define __stencil3d_add_32ns_32ns_32_1_1__HH__
#include "stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0.h"
#include <systemc>

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(stencil3d_add_32ns_32ns_32_1_1) {
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0 stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0_U;

    SC_CTOR(stencil3d_add_32ns_32ns_32_1_1):  stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0_U ("stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0_U") {
        stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0_U.a(din0);
        stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0_U.b(din1);
        stencil3d_add_32ns_32ns_32_1_1_AddSub_DSP_0_U.s(dout);

    }

};

#endif //
