`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 03:12:33 PM
// Design Name: 
// Module Name: restoringdivision
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

module restoringdivision(
                        input clk, rst_n,
                        input [3:0] dividend,
                        input [3:0] divisor,
                        output [3:0] quotient,  
                        output  [3:0] remainder  
                      );
  
                  wire [3:0]temp1r;
                  wire [3:0]temp2r;
                  wire [3:0]temp3r;
                        
       
                       wire [3:0]counter;
                       wire [3:0]temp1;
                       wire [3:0]temp2;
                       wire [3:0]temp3;      
                       wire [3:0]temp4;
                       wire [3:0]temp5;
		       wire c1,c2;
                       
                       wire [3:0]temp_cnt1;
                       wire [3:0]temp_cnt2;
                       wire [3:0]addr;
                       wire [3:0]a;
                                      
assign temp1[3:1] = remainder[2:0];
assign temp1[0] = quotient[3];
                       
assign temp2[3:1] = quotient[2:0];
                       
assign temp3[3:1] = remainder[2:0];
assign temp3[0] = quotient[3];
                                   
assign a = (counter == 4'b100)? 4'b0000 : 4'b0001;                                     
assign temp_cnt1 = (counter == 4'b100)? quotient : temp2;      
assign temp_cnt2 = (counter == 4'b100)? remainder: temp5;      
                                                     
  mux m1 (temp1r[0],dividend[0],temp_cnt1[0],rst_n);                    
  mux m2 (temp1r[1],dividend[1],temp_cnt1[1],rst_n);                    
  mux m3 (temp1r[2],dividend[2],temp_cnt1[2],rst_n);                    
  mux m4 (temp1r[3],dividend[3],temp_cnt1[3],rst_n);                    
                                             
  mux m5 (temp2r[0],1'b0,temp_cnt2[0],rst_n);                    
  mux m6 (temp2r[1],1'b0,temp_cnt2[1],rst_n);                    
  mux m7 (temp2r[2],1'b0,temp_cnt2[2],rst_n);                    
  mux m8 (temp2r[3],1'b0,temp_cnt2[3],rst_n);                                         
                     
 mux m9  (temp3r[0],1'b0,addr[0],rst_n);                    
 mux m10 (temp3r[1],1'b0,addr[1],rst_n);                    
 mux m11 (temp3r[2],1'b0,addr[2],rst_n);                    
 mux m12 (temp3r[3],1'b0,addr[3],rst_n);
 

                     
//register
dff d1 ( rst_n,clk,temp1r[0],quotient[0]);
dff d2 ( rst_n,clk,temp1r[1],quotient[1]);
dff d3 ( rst_n,clk,temp1r[2],quotient[2]);
dff d4 ( rst_n,clk,temp1r[3],quotient[3]);

dff d5 ( rst_n,clk,temp2r[0],remainder[0]);
dff d6 ( rst_n,clk,temp2r[1],remainder[1]);
dff d7 ( rst_n,clk,temp2r[2],remainder[2]);
dff d8 ( rst_n,clk,temp2r[3],remainder[3]);

dff d9  ( rst_n,clk,temp3r[0],counter[0]);
dff d10 ( rst_n,clk,temp3r[1],counter[1]);
dff d11 ( rst_n,clk,temp3r[2],counter[2]);
dff d12 ( rst_n,clk,temp3r[3],counter[3]);

full_add_4b f1 (counter,a,addr,c1);
full_sub_4b f2 (temp1,divisor,temp4,c2);

 mux m13 (temp2[0],1'b1,1'b0,temp4[3]);                    

 mux m14 (temp5[0],temp4[0],temp3[0],temp4[3]);                   
 mux m15 (temp5[1],temp4[1],temp3[1],temp4[3]);                    
 mux m16 (temp5[2],temp4[2],temp3[2],temp4[3]);                   
 mux m17 (temp5[3],temp4[3],temp3[3],temp4[3]);                   

endmodule
