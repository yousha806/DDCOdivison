`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 04:18:13 PM
// Design Name: 
// Module Name: full_sub
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


module full_sub(input a,b,c, output s,carry

    );
    
             wire w1,w2,w3;
             wire ab; 
             
xor(s,a,b,c);
not(ab,a);
and(w1,ab,c);
and(w2,ab,b);
and(w3,b,c);

or(carry,w1,w2,w3);
    
endmodule
