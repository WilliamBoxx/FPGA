`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 03:39:38 PM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
    input [3:0] x, y,
    input [1:0] op_sel,
    output [7:0] res,
    output carry_out,
    output overflow
    );

    wire [3:0] sum_diff;
    wire [7:0] mult_result;
    wire add_sub_c_out, add_sub_overflow;

    adder_subtractor add_sub_inst(
        .x(x),
        .y(y),
        .add_n(op_sel[0]),
        .s(sum_diff),
        .c_out(add_sub_c_out),
        .overflow(add_sub_overflow)
        );

    csa_multiplier mult_inst(
        .m(x),
        .q(y),
        .product(mult_result)
        );
    
    mux_2x1_8bit mux_2x1(
        .x(sum_diff),
        .y(mult_result),
        .s(op_sel[1]),
        .f(res)
        );

    assign carry_out = add_sub_c_out;
    assign overflow = add_sub_overflow;

endmodule