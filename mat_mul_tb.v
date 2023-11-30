`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2023 12:25:58
// Design Name: 
// Module Name: mat_mul_tb
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


module mat_mul_tb( );

reg clk ;
reg [15:0] data ;
reg load ;
wire done ;
wire [31:0] product ;
reg [3:0] address ;

mat_mul uut(clk, data, load, done, product, address );

initial 
    begin
     clk = 1 ;data = 0 ; load = 0 ;
     #100 
                                        data = 2 ; #10 load = 1 ;#60 load = 0 ;  #30 data = 8 ; #10 load = 1 ;#60 load = 0 ;  #30 data = 12; #10 load = 1 ;#60 load = 0 ;  #30 data = 1 ;        // 4x4 matrix q2
      #10 load = 1 ;#60 load = 0 ;  #30 data = 5;  #10 load = 1 ;#60 load = 0 ;  #30 data = 15 ;  #10 load = 1 ;#60 load = 0 ;  #30 data = 33;  #10 load = 1 ;#60 load = 0 ;  #30 data = 21 ;
      #10 load = 1 ;#60 load = 0 ;  #30 data = 100;   #10 load = 1 ;#60 load = 0 ; #30 data = 0 ;  #10 load = 1 ;#60 load = 0 ;  #30 data = 9;  #10 load = 1 ;#60 load = 0 ;  #30 data = 25 ;
      #10 load = 1 ;#60 load = 0 ;  #30 data = 0;   #10 load = 1 ;#60 load = 0 ;  #30 data = 2 ;  #10 load = 1 ;#60 load = 0 ;  #30 data = 10;  #10 load = 1 ;#60 load = 0 ;  #30 data = 34 ;   
     
      #10 load = 1 ;#60 load = 0 ;  #30 data = 4;   #10 load = 1 ;#60 load = 0 ;  #30 data = 16 ;  #10 load = 1 ;#60 load = 0 ;  #30 data = 45;  #10 load = 1 ;#60 load = 0 ;  #30 data = 21 ;     //4x4 matrix q1
      #10 load = 1 ;#60 load = 0 ;  #30 data = 6;   #10 load = 1 ;#60 load = 0 ;  #30 data = 3 ;  #10 load = 1 ;#60 load = 0 ;  #30 data =50;  #10 load = 1 ;#60 load = 0 ;  #30 data = 71 ;
      #10 load = 1 ;#60 load = 0 ;  #30 data = 22;   #10 load = 1 ;#60 load = 0 ;  #30 data = 0 ;  #10 load = 1 ;#60 load = 0 ;  #30 data = 1;  #10 load = 1 ;#60 load = 0 ;  #30 data = 30 ;
      #10 load = 1 ;#60 load = 0 ;  #30 data = 5;   #10 load = 1 ;#60 load = 0 ;  #30 data = 15 ;  #10 load = 1 ;#60 load = 0 ;  #30 data = 27;  #10 load = 1 ;#60 load = 0 ;  #30 data = 40 ;
     
     #10 load = 1 ;#60 load = 0 ; 
     #3565 address = 0 ;
     #20 address = 1 ;
     #20 address = 2 ;
     #20 address = 3 ;
     #20 address = 4 ;
     #20 address = 5 ;
     #20 address = 6 ;
     #20 address = 7 ;
     #20 address = 8 ;
     #20 address = 9 ;
     #20 address = 10 ;
     #20 address = 11 ;
     #20 address = 12 ;
     #20 address = 13 ;
     #20 address = 14 ;
     #20 address = 15 ;
     
     
     #500 $finish ;
     
     
     
        
        
        
    end
    
always
 #10 clk = ~clk ;    

endmodule
