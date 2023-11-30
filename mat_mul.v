`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2023 16:57:47
// Design Name: 
// Module Name: mat_mul
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


 module mat_mul(clk, load  );

 

input clk ;
wire [15:0] data ;
input load ;
 reg done = 0 ;
 reg [31:0] product ;
wire [3:0] address ;

reg [5:0] count = 0 ;
reg start_mul = 0 ;
reg [15:0] row_value_1, row_value_2, row_value_3, row_value_4 ;
reg [15:0] q1 [15:0] ;
reg load_mul_q1 = 0 ;
reg [15:0] load_mul_q2 ;
reg flag = 0 , load_prev ;
reg [31:0] result [15:0] ;
wire [31 :0 ] par_product[15:0] ;
wire load_mul_q1_wire ;
wire [15:0] done_mul ;
wire [31:0] par_sum1[7:0];
wire [31:0] sum[3:0];


ila_0 your_instance_name (
	.clk(clk), // input wire clk


	.probe0(data), // input wire [15:0]  probe0  
	.probe1(done), // input wire [0:0]  probe1 
	.probe2(product), // input wire [31:0]  probe2 
	.probe3(address) // input wire [3:0]  probe3
);


vio_0 your_instance_name1 (
  .clk(clk),                // input wire clk
  .probe_in0(done),    // input wire [0 : 0] probe_in0
  .probe_in1(product),    // input wire [31 : 0] probe_in1
  .probe_out0(address),  // output wire [3 : 0] probe_out0
  .probe_out1(data)  // output wire [15 : 0] probe_out1
);

assign load_mul_q1_wire = load_mul_q1 ; 

 mul_16 mat_1x1( .clk(clk), .q1(row_value_1), .q2(data),.product(par_product[0]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[0]), .start_csd(load_mul_q2[0]) );
 mul_16 mat_1x2( .clk(clk), .q1(row_value_1), .q2(data),.product(par_product[1]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[1]), .start_csd(load_mul_q2[1]) );
 mul_16 mat_1x3( .clk(clk), .q1(row_value_1), .q2(data),.product(par_product[2]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[2]), .start_csd(load_mul_q2[2]) );
 mul_16 mat_1x4( .clk(clk), .q1(row_value_1), .q2(data),.product(par_product[3]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[3]), .start_csd(load_mul_q2[3]) );
 mul_16 mat_2x1( .clk(clk), .q1(row_value_2), .q2(data),.product(par_product[4]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[4]), .start_csd(load_mul_q2[4]) );
 mul_16 mat_2x2( .clk(clk), .q1(row_value_2), .q2(data),.product(par_product[5]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[5]), .start_csd(load_mul_q2[5]) );
 mul_16 mat_2x3( .clk(clk), .q1(row_value_2), .q2(data),.product(par_product[6]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[6]), .start_csd(load_mul_q2[6]) );
 mul_16 mat_2x4( .clk(clk), .q1(row_value_2), .q2(data),.product(par_product[7]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[7]), .start_csd(load_mul_q2[7]) );
 mul_16 mat_3x1( .clk(clk), .q1(row_value_3), .q2(data),.product(par_product[8]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[8]), .start_csd(load_mul_q2[8]) );
 mul_16 mat_3x2( .clk(clk), .q1(row_value_3), .q2(data),.product(par_product[9]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[9]), .start_csd(load_mul_q2[9]) );
 mul_16 mat_3x3( .clk(clk), .q1(row_value_3), .q2(data),.product(par_product[10]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[10]), .start_csd(load_mul_q2[10]) );
 mul_16 mat_3x4( .clk(clk), .q1(row_value_3), .q2(data),.product(par_product[11]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[11]), .start_csd(load_mul_q2[11]) );
 mul_16 mat_4x1( .clk(clk), .q1(row_value_4), .q2(data),.product(par_product[12]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[12]), .start_csd(load_mul_q2[12]) );
 mul_16 mat_4x2( .clk(clk), .q1(row_value_4), .q2(data),.product(par_product[13]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[13]), .start_csd(load_mul_q2[13]) );
 mul_16 mat_4x3( .clk(clk), .q1(row_value_4), .q2(data),.product(par_product[14]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[14]), .start_csd(load_mul_q2[14]) );
 mul_16 mat_4x4( .clk(clk), .q1(row_value_4), .q2(data),.product(par_product[15]),.ready(), .idle(), .start(start_mul), .load_mul_q1(load_mul_q1_wire), .done(done_mul[15]), .start_csd(load_mul_q2[15]) );
 
 
 
 assign par_sum1[0] =  par_product[0] + par_product[4] ;
 assign par_sum1[1] =  par_product[8] + par_product[12] ;
 assign par_sum1[2] =  par_product[1] + par_product[5] ;
 assign par_sum1[3] =  par_product[9] + par_product[13] ;
 assign par_sum1[4] =  par_product[2] + par_product[6] ;
 assign par_sum1[5] =  par_product[10] + par_product[14] ;
 assign par_sum1[6] =  par_product[3] + par_product[7] ;
 assign par_sum1[7] =  par_product[11] + par_product[15] ;
 
 assign sum[0] = par_sum1[0] + par_sum1[1] ;
 assign sum[1] = par_sum1[2] + par_sum1[3] ;
 assign sum[2] = par_sum1[4] + par_sum1[5] ;
 assign sum[3] = par_sum1[6] + par_sum1[7] ; 
 
 always@(posedge clk )
 begin
   product =  result[address] ;
   
 end
  
 always@(posedge clk)
 begin
    if(count == 36)
        begin 
            if(load_mul_q1 == 1 )
                begin
                    result[0] <= sum[0] ;
                    result[1] <= sum[1] ;
                    result[2] <= sum[2] ;
                    result[3] <= sum[3] ;
                   // flag <= 0 ;
                end
           // else if(done_mul == 16'hffff)    flag = 1 ;
        end
    if(count == 40)
        begin 
            if(load_mul_q1 == 1 )
                begin
                    result[4] <= sum[0] ;
                    result[5] <= sum[1] ;
                    result[6] <= sum[2] ;
                    result[7] <= sum[3] ;
                   // flag <= 0 ;
                end
          //  else if(done_mul == 16'hffff)   flag = 1 ;
        end
    if(count == 44)
        begin 
            if(load_mul_q1 == 1 )
                begin
                    result[8] <= sum[0] ;
                    result[9] <= sum[1] ;
                    result[10] <= sum[2] ;
                    result[11] <= sum[3] ;
                   // flag <= 0 ;
                end
           // else if(done_mul == 16'hffff)   flag = 1 ;
        end
    if(count == 48)
        begin 
            if(load_mul_q1 <= 1 )
                begin
                    result[12] <= sum[0] ;
                    result[13] <= sum[1] ;
                    result[14] <= sum[2] ;
                    result[15] <= sum[3] ;
                   // flag <= 0 ;
                end
           // else  if(done_mul == 16'hffff)  flag = 1 ;
        end
 end
 
 
 always@(posedge clk)
 if(load == 0)
  load_prev = 1 ;
 /*always@(negedge clk )
 begin
    if(count <16 && load )
        begin
            load_mul_q2[count] <= 1 ;
            count <= count + 1 ;
        end 
    
        
 end */
    
 always@(posedge clk)
    begin
    if(count > 3 && count < 20 )
    begin   
        load_mul_q2[count - 4] = 0 ;
    end       
        if(load && load_prev && count <16)
            begin
                load_mul_q2[count] <= 1 ;
                count <= count + 1 ; 
                load_prev = 0 ;
            end              
       else if(count > 15 && count <32 )
            begin
                if(load)
                    begin   
                        q1[count[3:0]] <= data ;
                        count <= count + 1 ;    
                    end
            end
        else if(count > 31 )
            begin
                
                if(done_mul == 16'hffff && !start_mul)
                    begin
                        
                        count <= count + 4 ;
                        
                    end
                else
                    begin
                        load_mul_q1 <= 1 ;
                    end
                    
                 if(count[5:4] == 2'b11 )
                    begin
                        done = 1 ;
                    end    
                
            end
            
                
   end
             
 always@(negedge clk )
 begin
     if(done_mul == 16'hffff && start_mul )
        begin
            load_mul_q1 = 0 ;
            start_mul <= 0 ;
        end
     if(count > 31 && count < 48 && !start_mul )
            begin
                row_value_1 <= q1[{count[3:2], 2'b00}] ;
                row_value_2 <= q1[{count[3:2], 2'b01}] ;
                row_value_3 <= q1[{count[3:2], 2'b10}] ;
                row_value_4 <= q1[{count[3:2], 2'b11}] ;
               
                start_mul <= 1 ;
                
            end
            
 
 end


endmodule
