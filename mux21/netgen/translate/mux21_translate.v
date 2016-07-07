////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: mux21_translate.v
// /___/   /\     Timestamp: Wed Jul 06 16:47:50 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim mux21.ngd mux21_translate.v 
// Device	: 7a100tcsg324-3
// Input file	: mux21.ngd
// Output file	: E:\VHDL\mux21\netgen\translate\mux21_translate.v
// # of Modules	: 1
// Design Name	: mux21
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

module mux21 (
  a, b, s, y
);
  input a;
  input b;
  input s;
  output y;
  wire a_IBUF_0;
  wire b_IBUF_1;
  wire s_IBUF_2;
  wire y_OBUF_3;
  X_LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_y11 (
    .ADR0(s_IBUF_2),
    .ADR1(a_IBUF_0),
    .ADR2(b_IBUF_1),
    .O(y_OBUF_3)
  );
  X_BUF   a_IBUF (
    .I(a),
    .O(a_IBUF_0)
  );
  X_BUF   b_IBUF (
    .I(b),
    .O(b_IBUF_1)
  );
  X_BUF   s_IBUF (
    .I(s),
    .O(s_IBUF_2)
  );
  X_IPAD   a_6 (
    .PAD(a)
  );
  X_IPAD   b_7 (
    .PAD(b)
  );
  X_IPAD   s_8 (
    .PAD(s)
  );
  X_OPAD   y_9 (
    .PAD(y)
  );
  X_OBUF   y_OBUF (
    .I(y_OBUF_3),
    .O(y)
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

