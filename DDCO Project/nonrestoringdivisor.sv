`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 09:33:45 PM
// Design Name: 
// Module Name: nonrestoringdivisor
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


module nonrestoringdivisor #(parameter N = 4)
                       ( input clk, rst_n,
                         input [N-1:0] dividend,
                         input [N-1:0] divisor,
                         output reg [N-1:0] quotient,  
                         output reg [N-1:0] remainder  
                       );
                       
                       reg [N-1:0] temp1; //A
                       reg [N-1:0] temp2; //Q
                       reg [N-1:0] temp3; //Q
    
                       reg [$clog2(N):0] counter;    
always@(posedge clk)
  begin
  if(rst_n)
    begin
    remainder <= 'b0;
    quotient <= dividend;
    counter <= 'b0;
    end
  else
    begin
      
    if(counter != N)
      begin
    counter <= counter + 1'b1;
      remainder <= temp3;
      quotient <= temp2;    
      end     
    end
    end
    
always_comb
  begin
  {temp1,temp2} = {remainder,quotient} << 1'b1;
  temp3 = temp1; 
  temp1 = temp1 - divisor;  //A=A-M
  if(temp1[N-1])
    temp2[0] = 1'b0;
  else
    begin
    temp2[0] = 1'b1;
    temp3 = temp1;
    end   
  end    
    
endmodule    
    
                           
                           
                             
  
