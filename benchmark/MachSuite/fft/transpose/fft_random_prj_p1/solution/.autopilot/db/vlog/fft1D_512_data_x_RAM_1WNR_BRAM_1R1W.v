// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module fft1D_512_data_x_RAM_1WNR_BRAM_1R1W (
     
    address0, ce0,
    d0, we0, 
    q0, 
     
    address1, ce1,
    
    q1, 
     
    address2, ce2,
    
    q2, 
     
    address3, ce3,
    
    q3, 
    
    reset, clk);

parameter DataWidth = 128;
parameter AddressWidth = 2;
parameter AddressRange = 4;
parameter COL_WIDTH = 8;
parameter NUM_COL = (DataWidth/COL_WIDTH);

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input[NUM_COL-1:0] we0; 
output reg[DataWidth-1:0] q0; 

input[AddressWidth-1:0] address1;
input ce1;

output reg[DataWidth-1:0] q1; 

input[AddressWidth-1:0] address2;
input ce2;

output reg[DataWidth-1:0] q2; 

input[AddressWidth-1:0] address3;
input ce3;

output reg[DataWidth-1:0] q3; 

input reset;
input clk;


(* ram_style = "block"  *)reg [DataWidth-1:0] ram0[0:AddressRange-1];

(* ram_style = "block"  *)reg [DataWidth-1:0] ram1[0:AddressRange-1];

(* ram_style = "block"  *)reg [DataWidth-1:0] ram2[0:AddressRange-1];


 

genvar i;
// write to all ram
generate
    for (i=0;i<NUM_COL;i=i+1) begin
        always @(posedge clk) begin
            if (ce0) begin
                if (we0[i]) begin
                    ram0[address0][i*COL_WIDTH +: COL_WIDTH] <= d0[i*COL_WIDTH +: COL_WIDTH]; 
                end

                q0[i*COL_WIDTH +: COL_WIDTH] <= ram0[address0][i*COL_WIDTH +: COL_WIDTH];

            end
        end
    end
endgenerate

generate
    for (i=0;i<NUM_COL;i=i+1) begin
        always @(posedge clk) begin
            if (ce0) begin
                if (we0[i]) begin
                    ram1[address0][i*COL_WIDTH +: COL_WIDTH] <= d0[i*COL_WIDTH +: COL_WIDTH]; 
                end

            end
        end
    end
endgenerate

generate
    for (i=0;i<NUM_COL;i=i+1) begin
        always @(posedge clk) begin
            if (ce0) begin
                if (we0[i]) begin
                    ram2[address0][i*COL_WIDTH +: COL_WIDTH] <= d0[i*COL_WIDTH +: COL_WIDTH]; 
                end

            end
        end
    end
endgenerate


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram0[address1];
    end
end
always @(posedge clk)  
begin 
    if (ce2) begin
        q2 <= ram1[address2];
    end
end
always @(posedge clk)  
begin 
    if (ce3) begin
        q3 <= ram2[address3];
    end
end


endmodule
