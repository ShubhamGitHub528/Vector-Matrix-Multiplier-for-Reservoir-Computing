`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 00:03:53
// Design Name: 
// Module Name: mul_16
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


module mul_16( clk, q1, q2,product,ready, idle, start, load_mul_q1, done , start_csd);

input clk ;
input [15:0] q1, q2 ;
input  start ;
output reg ready  = 1 ;
output reg idle , done ;
output reg [31:0] product ;
input load_mul_q1 ;

input start_csd ;
wire ready_csd, idle_csd ;
wire [33:0] csd_q2 ;
wire [31:0] po ;
wire po_valid ;
reg load_q1 = 0 ;
reg new = 1 ;
//reg  [15:0] carry = 0  ;
reg [7:0] par_mul ;
reg start_add = 0 , start_add_4 = 0 , start_add_2 = 0 , start_add_1 = 0, collect_product = 0 ;
reg [7:0] par_sum_8 ;
wire [3:0] par_sum_4 ;
wire [1:0] par_sum_2 ;
wire product_serial ;
wire [15:0] Serial_out, Serial_Out_neg ;
reg [2:0] count = 0 ;
reg start_prev, first = 1 ;

Bin_CSD_converter csd_q( .clk(clk), .a({0,q2}), .ready(ready_csd), .idle(idle_csd), .start(start_csd),.csd(csd_q2) );

shift_reg_32 q1_0( .Clk(clk), .Parallel_In({16'd0, q1}),.load(load_mul_q1), .Serial_Out(Serial_out[0]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[0]));
shift_reg_32 q1_1( .Clk(clk), .Parallel_In({15'd0, q1, 1'd0 }) ,.load(load_mul_q1), .Serial_Out(Serial_out[1]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[1]));
shift_reg_32 q1_2( .Clk(clk), .Parallel_In({14'd0, q1, 2'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[2]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[2]));
shift_reg_32 q1_3( .Clk(clk), .Parallel_In({13'd0, q1, 3'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[3]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[3]));
shift_reg_32 q1_4( .Clk(clk), .Parallel_In({12'd0, q1, 4'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[4]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[4]));
shift_reg_32 q1_5( .Clk(clk), .Parallel_In({11'd0, q1, 5'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[5]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[5]));
shift_reg_32 q1_6( .Clk(clk), .Parallel_In({10'd0, q1, 6'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[6]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[6]));
shift_reg_32 q1_7( .Clk(clk), .Parallel_In({9'd0, q1, 7'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[7]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[7]));
shift_reg_32 q1_8( .Clk(clk), .Parallel_In({8'd0, q1, 8'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[8]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[8]));
shift_reg_32 q1_9( .Clk(clk), .Parallel_In({7'd0, q1, 9'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[9]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[9]));
shift_reg_32 q1_10( .Clk(clk), .Parallel_In({6'd0, q1, 10'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[10]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[10]));
shift_reg_32 q1_11( .Clk(clk), .Parallel_In({5'd0, q1, 11'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[11]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[11]));
shift_reg_32 q1_12( .Clk(clk), .Parallel_In({4'd0, q1, 12'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[12]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[12]));
shift_reg_32 q1_13( .Clk(clk), .Parallel_In({3'd0, q1, 13'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[13]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[13]));
shift_reg_32 q1_14( .Clk(clk), .Parallel_In({2'd0, q1, 14'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[14]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[14]));
shift_reg_32 q1_15( .Clk(clk), .Parallel_In({1'd0, q1, 15'd0}) ,.load(load_mul_q1), .Serial_Out(Serial_out[15]), .start(load_q1), .Serial_Out_neg(Serial_Out_neg[15]));


generate
    genvar k ;
    for(k= 0; k <= 6 ; k = k+2 )
        begin
            add_sub add_sub4(.A(par_mul[k]),.B(par_mul[k + 1]), .clk(clk),  .S(par_sum_4[k/2]), .start(start_add_4) );
        end
endgenerate 

  
generate
    genvar m ;
    for(m= 0; m <= 2 ; m = m+2 )
        begin
            add_sub add_sub2(.A(par_sum_4[m]),.B(par_sum_4[m + 1]), .clk(clk),  .S(par_sum_2[m/2]), .start(start_add_2) );
        end
endgenerate

  add_sub final(.A(par_sum_2[0]),.B(par_sum_2[1]), .clk(clk),  .S(product_serial), .start(start_add_1) );
  
  sipo_shift_reg sipo_reg32(.clk(clk), .si(product_serial), .po(po), .start(collect_product) , .done(po_valid) );
  
  always@(posedge clk)
    begin
        if(po_valid)
            begin
                product <= po ;
                idle <= 0 ;
                ready <= 1 ;
                load_q1 <= 0 ;
                new <= 0 ;
                done <= 1 ;
                
                
            end
    end

 always@(posedge clk)
       begin
        /* if(ready_csd && start && !start_prev  )
            begin
                 new <= 1 ;
                ready <= 0 ;
                idle <= 1 ;
                done <= 0 ;
                count <= 0 ;
                collect_product <= 0 ;
                start_add_1 <= 0 ;
                start_add_2 <= 0 ;
                start_add_4 <= 0 ;
                first = 1 ;
               // start_prev <= 0 ;
            end */
        start_prev <= start ;
       end
   
   always@(negedge clk)
    begin
        if(count == 2 )
            start_add_2 = 1 ;
        if(count == 3 )
            start_add_1 = 1 ;
        if(count == 4 )
            collect_product = 1 ;
    end
  integer i ;
 // assign clk_q1 = !idle_csd & clk ;   
 always@(posedge clk)
    begin
     if(ready_csd && start && !start_prev  )
            begin
                 new <= 1 ;
                ready <= 0 ;
                idle <= 1 ;
                done <= 0 ;
                count <= 0 ;
                collect_product <= 0 ;
                start_add_1 <= 0 ;
                start_add_2 <= 0 ;
                start_add_4 <= 0 ;
                first = 1 ;
               // start_prev <= 0 ;
            end
       else if(idle_csd == 0 && start && load_mul_q1 && new )
            begin 
               if(load_q1 == 0)
                 load_q1 = 1  ;
               else if(first == 0 )
                begin
                    start_add_4 = 1 ;
                    count = count+1 ;
                        for(i = 0; i<=28; i = i+4 )
                            begin
                                if({csd_q2[i+3], csd_q2[i+2],csd_q2[i+1], csd_q2[i]} == 4'b0000)
                                    begin
                                        par_mul[i/4] = 0 ;
                                    end
                                else if({csd_q2[i+3], csd_q2[i+2],csd_q2[i+1], csd_q2[i]} == 4'b0001)
                                    begin
                                        par_mul[i/4] = Serial_out[i/2] ;
                                    end
                                else if({csd_q2[i+3], csd_q2[i+2],csd_q2[i+1], csd_q2[i]} == 4'b0100)
                                    begin
                                        par_mul[i/4] = Serial_out[(i+2)/2] ;
                                        
                                    end
                                 else if({csd_q2[i+3], csd_q2[i+2],csd_q2[i+1], csd_q2[i]} == 4'b0011)
                                    begin
                                        par_mul[i/4] = Serial_Out_neg[i/2] ;
                                        
                                    end
                                else if({csd_q2[i+3], csd_q2[i+2],csd_q2[i+1], csd_q2[i]} == 4'b1100)
                                    begin
                                        par_mul[i/4] = Serial_Out_neg[(i+2)/2] ;
                                        
                                    end
                                else
                                    begin
                                        par_mul = 0 ;
                                    end 
                            end
                                
                end 
                else first = 0 ;
            end
    end
 
 
endmodule
