`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 16:39:57
// Design Name: 
// Module Name: dadda_mul
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


module dadda_mul(

    input [15:0] A,B,
    output [32:0] prod   

    );
    
    wire pp[15:0][15:0];
	wire [31:0] to_FA [1:0];
	part_prod_gen_16 pp1(.A(A), .B(B), .P(pp)); 
	multiplier_16x16 mul1(.pp(pp),.to_FA (to_FA));
	CLA32 cla1(.sum(prod[31:0]), .cout(prod[32]), .a(to_FA[0]), .b(to_FA[1]));
   
   
    
endmodule
