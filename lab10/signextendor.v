`timescale 1ns / 1ps
module ImmGenerator(Imm64, Imm26, Ctrl);
  output reg [63:0] Imm64;
  input [25:0] Imm26;
  input [2:0] Ctrl;

  reg extBit;

  always @(Ctrl) begin
	if (Ctrl == 2'b00) begin
	    assign Imm64 = {{52{1'b0}}, Imm26[21:10]};
	end	
	else if (Ctrl == 2'b01) begin
	    assign extBit = Imm26[20];
	    assign Imm64 = {{55{extBit}}, Imm26[20:12]};
	end

	else if (Ctrl == 2'b10) begin
	    assign extBit = Imm26[25];
	    assign Imm64 = {{38{extBit}}, Imm26};
	end
	else if (Ctrl == 2'b11) begin
	    assign extBit = Imm26[23];
	    assign Imm64 = {{45{extBit}}, Imm26[23:5]};	
 	end

  end

//I-type 	00
//Load/Store 	01
//Uncond. Branch 	10
//Cond. Branch 	11
endmodule
