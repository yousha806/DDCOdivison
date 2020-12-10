`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 03:00:21 PM
// Design Name: 
// Module Name: mux
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


module mux(output y, input d0,d1,s);
    wire t1,t2,sbar;                 //y=~sd0+sd1
    
    and (t1,d1,s),(t2,d0,sbar);
    not (sbar,s);
    or(y,t1,t2); 
    
endmodule
