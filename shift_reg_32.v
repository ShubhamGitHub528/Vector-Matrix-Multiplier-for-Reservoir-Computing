`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 13:15:54
// Design Name: 
// Module Name: shift_reg_32
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


module shift_reg_32( Clk, Parallel_In,load, Serial_Out, start, Serial_Out_neg);

input Clk,load, start ;
input [31:0]Parallel_In;

output reg Serial_Out,Serial_Out_neg ;
wire [31:0] ntmp , n2tmp;
reg[31:0]tmp, neg_tmp, tmp1 ;
reg neg_valid  ,loaded = 0 ;

assign ntmp = ~tmp1 ; 

always@(posedge Clk)
    begin
        if(neg_valid == 0 )
            neg_tmp =  ntmp + 1 ; 
            neg_valid = 1 ;
    end

always@(posedge Clk  )
if(load && !start)
    begin
        tmp = Parallel_In ;
        tmp1 = Parallel_In ;
        neg_valid = 0 ;
       // loaded = 1 ;
    end
  //  else loaded = 0 ;
always @(negedge Clk)
    begin
        if(start && neg_valid )
            begin
                Serial_Out <= tmp[0];
                tmp <= {1'b0 , tmp[31:1]};
                Serial_Out_neg <= neg_tmp[0];
                neg_tmp <= {1'b0 , neg_tmp[31:1]};
            end
        else
            begin
                Serial_Out <= 0 ;
               
            end
    end
    
endmodule

