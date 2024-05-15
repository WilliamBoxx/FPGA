`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 02:14:21 AM
// Design Name: 
// Module Name: mux_2x1_3bit
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


module mux_2x1_3bit(
    input [2:0] x, y, 
    input s,
    output [2:0] f
    );

    mux_2x1_simple M0 (x[0], y[0], s, f[0]);
    mux_2x1_simple M1 (
        .x1(x[1]),
        .x2(y[1]),
        .s(s),
        .f(f[1])
    );
    mux_2x1_simple M2 (
        .x1(x[2]),
        .x2(y[2]),
        .s(s),
        .f(f[2])
    );
endmodule
