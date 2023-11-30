`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2023 12:48:38
// Design Name: 
// Module Name: sipo_shift_reg
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


module sipo_shift_reg(clk, si, po, start , done );

input clk, si, start;
output [31:0] po;
output reg done ;
reg [31:0] tmp;
reg [5:0] count = 0 ;

always @(posedge clk)
    begin
        if(start)
            begin
                tmp = {si,tmp[31:1]};
                count = count + 1 ;
            end
        if(count == 32 )
            done = 1 ;
        if(count == 33 )
            done = 0 ;
    end
    
always@(posedge start )
    count = 0 ;

assign po = tmp;

endmodule

