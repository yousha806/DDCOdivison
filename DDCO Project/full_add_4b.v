`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 03:43:45 PM
// Design Name: 
// Module Name: full_add_4b
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


module full_add_4b(input [3:0]a,b,
                   output [3:0]sum,
                   output carry

    );
                    wire [2:0]c;
    
    full_add f1 (a[0],b[0],1'b0,sum[0],c[0]);
    full_add f2 (a[1],b[1],c[0],sum[1],c[1]);
    full_add f3 (a[2],b[2],c[1],sum[2],c[2]);
    full_add f4 (a[3],b[3],c[2],sum[3],carry);
      
    
endmodule
