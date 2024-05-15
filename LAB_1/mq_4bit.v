`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:25:18 PM
// Design Name: 
// Module Name: mq_4bit
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


module mq_4bit(
    input [3:0]m,
    input q,
    output [3:0] mq
    );
    
    assign mq = {m[3] & q, m[2] & q, m[1] & q, m[0] & q};
endmodule
