`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 02:15:13 AM
// Design Name: 
// Module Name: mux_4x1_3bit
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


module mux_4x1_3bit(
    input [2:0] x, y, z, w,
    input [1:0] s,
    output [2:0] m,
    output s0_out, s1_out
    );
    
    //output of first mux o1 and second mux o2
    wire [2:0] o0, o1;
    //LED indication of [1:0]s on or off
    assign s0_out = s[0];
    assign s1_out = s[1];
    
    mux_2x1_3bit M0 (x[2:0], y[2:0], s[0], o0[2:0]);
    mux_2x1_3bit M1 (z[2:0], w[2:0], s[0], o1[2:0]);
    mux_2x1_3bit M2 (o0[2:0], o1[2:0], s[1], m[2:0]);
    
endmodule
