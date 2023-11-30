`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2023 16:44:34
// Design Name: 
// Module Name: FIFO
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


module FIFO( Clk, dataIn, RD, WR, dataOut, Rst,EMPTY, FULL, Count ,readCounter, writeCounter ); 

input  Clk, RD, WR, Rst;

output  EMPTY, FULL;
output [2:0]  Count = 0; 
input   [15:0] dataIn;

output reg [15:0] dataOut; // internal registers 
reg  EMPTY, FULL;
reg [2:0]  Count = 0; 

reg [15:0] FIFO_0,FIFO_1,FIFO_2,FIFO_3 ; 
 output reg [2:0]  readCounter = 0, 
           writeCounter = 0; 
wire [2:0] read_count , write_count ;
           
           
    assign read_count = readCounter ;
    assign write_count = writeCounter ;
      always@( negedge Clk )
       if (RD ) 
                begin 
                  case (read_count[1:0] )
                    2'b00 : dataOut  =  FIFO_0  ; 
                    2'b01 : dataOut  =  FIFO_1  ; 
                    2'b10 : dataOut  =  FIFO_2  ; 
                    2'b11 : dataOut  =  FIFO_3  ; 
                    default : dataOut  =  dataOut  ; 
                  endcase
                end
      else
            dataOut <= 0 ;
            
always @ (Count) 
begin
   EMPTY <= (Count==0)? 1'b1:1'b0; 
   FULL <= (Count==4)? 1'b1:1'b0; 
end
always @ (posedge Clk) 

begin 
        if (Rst) begin 

            readCounter <= 0; 
            writeCounter <= 0; 
                 end 

       else
          begin
           if (WR==1'b1 )
                 begin
                    
                    writeCounter  <= writeCounter+1; 
                     case (write_count[1:0] )
                                       2'b00 :   FIFO_0 = dataIn ; 
                                       2'b01 :   FIFO_1 = dataIn ;  
                                       2'b10 :   FIFO_2 = dataIn ; 
                                       2'b11 :   FIFO_3 = dataIn ; 
                                       default : begin
                                                       FIFO_0 <= FIFO_0 ;
                                                       FIFO_1 <= FIFO_1 ;  
                                                       FIFO_2 <= FIFO_2  ; 
                                                       FIFO_3 <= FIFO_3 ;
                                                 end
                                     endcase
                 end 
         if (RD ==1'b1) 
           begin 
           // dataOut  = FIFO[readCounter[1:0]]; 
            readCounter <= readCounter+1; 
           end 
           else
             dataOut <= 0 ;

        end

end
always @ (writeCounter or readCounter )
begin
 if (readCounter >= writeCounter) begin 

  Count = readCounter - writeCounter ; 

 end 

 else if (writeCounter > readCounter) 

  Count = writeCounter - readCounter ; 
end

endmodule

