`timescale 1ns / 1ps

module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
	output [63:0] BusA; // inputs and outputs
	output [63:0] BusB;
	input [63:0] BusW;
	input [4:0] RA;
	input [4:0] RB;
	input [4:0] RW;
	input RegWr;
	input Clk; 

	reg [63:0] registers [31:0]; // creating 32 registers that are 64 big
	initial registers[31] <= 'd0; // makes sure the 31 register is always 0
	always @ (negedge Clk) // writing at the negedge
	begin
		if(RegWr) // if write is high 
			registers[RW] <=  BusW;  // the register specified by RW is set to BUSW
			registers[31] <= 'd0; // making sure register 31 is always 0
	end	
	assign BusA = registers[RA]; // reading out the register RA in BusA
	assign BusB = registers[RB]; // reading out the register RB in BusB

endmodule