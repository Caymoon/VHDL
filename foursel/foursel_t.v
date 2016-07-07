`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:35 07/06/2016
// Design Name:   foursel
// Module Name:   E:/VHDL/foursel/foursel_t.v
// Project Name:  foursel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: foursel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module foursel_t;

	// Inputs
	reg a;
	reg b;
	reg c;
	reg d;
	reg [1:0] sel;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	foursel uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.sel(sel), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 1;
		c = 0;
		d = 0;
		sel = 10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		

	end
      
endmodule

