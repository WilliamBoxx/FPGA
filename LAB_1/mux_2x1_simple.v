`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 10:10:46 PM
// Design Name: 
// Module Name: mux_2x1_simple
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


module mux_2x1_simple(
    input x1,x2,s,
    output f
    );

    and A1 (g1, x2, s);
    and A0 (g0, x1, ~s);
    or O0 (f, g0, g1);
    
endmodule
