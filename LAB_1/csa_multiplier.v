`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2024 04:25:28 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
    input [3:0] m,
    input [3:0] q,
    output [7:0] product
    );
    
    wire [3:0] m0q, m1q, m2q, m3q;
    
    mq_4bit mq0out (
        .m(m),
        .q(q[0]),
        .mq(m0q)
    );
    mq_4bit mq1out (
        .m(m),
        .q(q[1]),
        .mq(m1q)
    );
    mq_4bit mq2out (
        .m(m),
        .q(q[2]),
        .mq(m2q)
    );
    mq_4bit mq3out (
        .m(m),
        .q(q[3]),
        .mq(m3q)
    );

    full_adder top1(
        .x(m0q[1]),
        .y(m1q[0]),
        .c_in(1'b0),
        .s(product[1]),
        .c_out(top1_to_middle1)
    );
    full_adder top2(
        .x(m1q[1]),
        .y(m2q[0]),
        .c_in(m0q[2]),
        .s(top2_to_middle1),
        .c_out(top2_to_middle2)
    );
    full_adder top3(
        .x(m2q[1]),
        .y(m3q[0]),
        .c_in(m1q[2]),
        .s(top3_to_middle2),
        .c_out(top3_to_middle3)
    );
    full_adder top4(
        .x(m3q[1]),
        .y(1'b0),
        .c_in(m2q[2]),
        .s(top4_to_middle3),
        .c_out(top4_to_middle4)
    );
    full_adder middle1(
        .x(1'b0),
        .y(top2_to_middle1),
        .c_in(top1_to_middle1),
        .s(product[2]),
        .c_out(middle1_to_bottom1)
    );
    full_adder middle2(
        .x(m0q[3]),
        .y(top3_to_middle2),
        .c_in(top2_to_middle2),
        .s(middle2_to_bottom1),
        .c_out(middle2_to_bottom2)
    );
    full_adder middle3(
        .x(m1q[3]),
        .y(top4_to_middle3),
        .c_in(top3_to_middle3),
        .s(middle3_to_bottom2),
        .c_out(middle3_to_bottom3)
    );
    full_adder middle4(
        .x(m2q[3]),
        .y(m3q[2]),
        .c_in(top4_to_middle4),
        .s(middle4_to_bottom3),
        .c_out(middle4_to_bottom4)
    );
    full_adder bottom1(
        .x(middle1_to_bottom1),
        .y(middle2_to_bottom1),
        .c_in(1'b0),
        .s(product[3]),
        .c_out(bottom1_to_bottom2)
    );
    full_adder bottom2(
        .x(middle2_to_bottom2),
        .y(middle3_to_bottom2),
        .c_in(bottom1_to_bottom2),
        .s(product[4]),
        .c_out(bottom2_to_bottom3)
    );
    full_adder bottom3(
        .x(middle3_to_bottom3),
        .y(middle4_to_bottom3),
        .c_in(bottom2_to_bottom3),
        .s(product[5]),
        .c_out(bottom3_to_bottom4)
    );
    full_adder bottom4(
        .x(middle4_to_bottom4),
        .y(m3q[3]),
        .c_in(bottom3_to_bottom4),
        .s(product[6]),
        .c_out(product[7])
    );
    
    assign product[0] = m0q[0];
    
endmodule
