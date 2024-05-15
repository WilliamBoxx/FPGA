`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 09:35:56 PM
// Design Name: 
// Module Name: mux_2x1_8bit
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


module mux_2x1_8bit(
    input [7:0] x, y,
    input s,
    output [7:0] f
    );
    
    generate
    genvar i;
        for (i = 0; i < 8; i = i + 1) 
        begin : stage
            mux_2x1_simple mux_bit(
                .x1(x[i]),
                .x2(y[i]),
                .s(s),
                .f(f[i])
            );
        end
    endgenerate
    
endmodule
