`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2023 10:11:10
// Design Name: 
// Module Name: Bin_CSD_converter
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


module Bin_CSD_converter( clk, a, ready, idle, start,csd );

input clk, start ;
input [16:0] a ;
output reg ready  = 1 ;
output reg idle = 1 ;
output reg [33:0] csd ;

integer i, j ;
reg[16:0] a1 ;
reg [33:0] c ;
reg [4:0] count = 5'b00000 ;
reg carry=0;
reg start_csd = 0 ;
//reg start_prev = 0 ;
//reg clkc = 0 ;
 //reg temp ;
 wire temp ;
//assign a[15] = a[14];
//assign a[16] = 0;


/*always@(posedge clk )
begin
    if(ready== 1 && start  )
        begin
          a1 <= a ;
          idle <= 1 ;
          ready <= 0 ;
          i <= 0 ;
          c <= 0 ;
          count <= 0 ;
          carry <= 0 ; 
          start_csd = 1 ; 
        end 
   // start_prev = start ;
end */
    
always @( posedge clk )
if(ready== 1 && start  )
        begin
          a1 <= a ;
          idle <= 1 ;
          ready <= 0 ;
          i <= 0 ;
          c <= 0 ;
          count <= 0 ;
          carry <= 0 ; 
          start_csd = 1 ; 
        end 
else if(start_csd == 1 && ready == 0 )
    begin
        //c = 0 ;
        if(i <= 16)
//for(i=0;i<16;i=i+1)
            begin
//if statement carry =0 
                if(i == 16 )
                    begin
                        idle <= 0;
                        ready <= 1;
                        csd <= c ;
 
                    end
                else
                    begin
                        j = i + count ;
                        if(carry == 0)
                        begin
                        
                        if({a1[i+1],a1[i]}==2'b00 ||{a1[i+1],a1[i]}==2'b10)
                            begin 
                            c[j ] <= 1'b0;
                            c[j+1] <= 1'b0 ;
                            i <= i +1 ;
                            carry <= 0;
                            count <= count + 1 ;
                           
                           
                            end 
                        else if({a1[i+1],a1[i]}==2'b01)
                            begin
                                c[j] <= 1'b1;
                                c[j+1] <= 1'b0;
                                i <= i +1 ;
                                carry <= 0;
                                count <= count + 1 ;
                           
                                
                            end
                        else if({a1[i+1],a1[i]}==2'b11)
                            begin
                                count <= count + 2 ;
                                c[j] <= 1'b1;
                                c[j + 1] <= 1'b1;
                                carry <= 1;
                                i <= i +2 ;
                     
                              
                            end
                        else
                            begin
                                c <= a1;
                                carry <= 0;
                                i <= i +1 ;
                  
                           
                            end
                        end//if end
                        ///////else statement carry =1
                        else
                            begin
                            if({a1[i+1],a1[i]}==2'b01 ||{a1[i+1],a1[i]}==2'b11)
                                begin 
                                    c[j] <= 1'b0;
                                    c[j+1] <= 1'b0;
                                    i <= i +1 ;
                                    carry <= 1;
                                    count <= count + 1 ;
                    
                               
                                end 
                            else if({a1[i+1],a1[i]}==2'b00)
                                begin
                                    c[j] <= 1'b1;
                                    c[j+1] <= 1'b0;
                                    i <= i +1 ;
                                    carry <= 0;
                                    count <= count + 1 ;
                     
                                 
                                end
                            else if({a1[i+1],a1[i]}==2'b10)
                                begin
                                    c[j] <= 1'b1;
                                    count <= count + 2 ;
                                   c[j+1] <= 1'b1;
                                    carry <= 1;
                                    i <= i +2 ;
                              
                                 
                                end
                            else
                                begin
                                    c <= a1;
                                    carry <= 0;
                                    i <= i + 1 ;
                     
                                
                                end
                        end//else end
                        
                    end
                        
                end// for end
                        
            end//always end
                        
endmodule


