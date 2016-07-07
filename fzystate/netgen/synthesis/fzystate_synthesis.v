////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: fzystate_synthesis.v
// /___/   /\     Timestamp: Thu Jul 07 14:41:13 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim fzystate.ngc fzystate_synthesis.v 
// Device	: xc7a100t-3-csg324
// Input file	: fzystate.ngc
// Output file	: E:\VHDL\fzystate\netgen\synthesis\fzystate_synthesis.v
// # of Modules	: 1
// Design Name	: fzystate
// Xilinx        : D:\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module fzystate (
  clk, reset, read_ins, read_data, write_data, oe, we
);
  input clk;
  input reset;
  input read_ins;
  input read_data;
  input write_data;
  output oe;
  output we;
  wire clk_BUFGP_0;
  wire reset_IBUF_1;
  wire read_ins_IBUF_2;
  wire read_data_IBUF_3;
  wire write_data_IBUF_4;
  wire oe_OBUF_7;
  wire we_OBUF_8;
  wire reset_inv;
  wire Mram__n0027;
  wire Mram__n00271;
  wire [1 : 0] pr_state;
  wire [1 : 0] nx_state;
  FDC #(
    .INIT ( 1'b0 ))
  pr_state_0 (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF_1),
    .D(nx_state[0]),
    .Q(pr_state[0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  pr_state_1 (
    .C(clk_BUFGP_0),
    .CLR(reset_IBUF_1),
    .D(nx_state[1]),
    .Q(pr_state[1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  we_3 (
    .C(clk_BUFGP_0),
    .CE(reset_inv),
    .D(Mram__n0027),
    .Q(we_OBUF_8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  oe_4 (
    .C(clk_BUFGP_0),
    .CE(reset_inv),
    .D(Mram__n00271),
    .Q(oe_OBUF_7)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  Mram__n002712 (
    .I0(pr_state[0]),
    .I1(pr_state[1]),
    .O(Mram__n0027)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  Mram__n0027111 (
    .I0(pr_state[0]),
    .I1(pr_state[1]),
    .O(Mram__n00271)
  );
  LUT3 #(
    .INIT ( 8'hF4 ))
  Mmux_nx_state11 (
    .I0(read_data_IBUF_3),
    .I1(write_data_IBUF_4),
    .I2(read_ins_IBUF_2),
    .O(nx_state[0])
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  Mmux_nx_state21 (
    .I0(read_ins_IBUF_2),
    .I1(read_data_IBUF_3),
    .I2(write_data_IBUF_4),
    .O(nx_state[1])
  );
  IBUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_1)
  );
  IBUF   read_ins_IBUF (
    .I(read_ins),
    .O(read_ins_IBUF_2)
  );
  IBUF   read_data_IBUF (
    .I(read_data),
    .O(read_data_IBUF_3)
  );
  IBUF   write_data_IBUF (
    .I(write_data),
    .O(write_data_IBUF_4)
  );
  OBUF   oe_OBUF (
    .I(oe_OBUF_7),
    .O(oe)
  );
  OBUF   we_OBUF (
    .I(we_OBUF_8),
    .O(we)
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_0)
  );
  INV   reset_inv1_INV_0 (
    .I(reset_IBUF_1),
    .O(reset_inv)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

