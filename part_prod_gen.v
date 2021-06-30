`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 16:40:22
// Design Name: 
// Module Name: part_prod_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module part_prod_gen_16(
	input [15:0] A,
	input [15:0] B,
	output P[15:0][15:0]); 	//portlist can be 2D array in verilog 
	genvar i,j;
//	variable j;
	generate
		for(i = 0; i < 16; i = i +1) begin:part_product
		  for(j = 0; j < 16; j = j +1) begin
			assign P[i][j] = A[j] & B[i] ;
		
		end
		end
	endgenerate
endmodule