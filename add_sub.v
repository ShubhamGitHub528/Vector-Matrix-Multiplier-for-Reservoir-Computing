`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2023 23:44:31
// Design Name: 
// Module Name: add_sub
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


module add_sub(A,B, clk, S, start );

input A, B, clk, start ;
output reg S;
wire w1 , w2, w3, w4 , w5 ;
reg Cout = 0 ;
reg tmp  = 0 ;


assign w1 = A ^ B ;
assign w5 = w1 ^ Cout ;
assign w2 = A & B ;
assign w3 = w1 & Cout ;
assign w4 = w2 | w3 ;

always@(posedge clk )
begin
        Cout = w4 ;
        S = w5 ;
        tmp = start ;
        
        if(start == 0)
            Cout = 0 ;
end

endmodule
