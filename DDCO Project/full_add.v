`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 03:41:34 PM
// Design Name: 
// Module Name: full_add
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


module full_add(input a,b,c,output s,carry

    );
              wire w1,w2,w3;
    
    xor(s,a,b,c);
    
    and(w1,a,b);
    and(w2,b,c);
    and(w3,a,c);
    
    or(carry,w1,w2,w3);
    
endmodule
