`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2021 00:57:52
// Design Name: 
// Module Name: fa
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


module fa( 

    input A, B, Ci,
    output S, Co
    
    );
    
     xor xor1(S, A, B, Ci);
     
     assign Co = (A & B) | (B & Ci) | (Ci & A);
    
endmodule
