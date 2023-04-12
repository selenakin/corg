`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2023 14:52:45
// Design Name: 
// Module Name: MUX_4_bit
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


module MUX_4bit (
    select,
    input_1,
    input_2,
    input_3,
    input_4,
    out
);
    input wire [1:0]select;
    input wire [7:0]input_1;
    input wire [7:0]input_2;
    input wire [7:0]input_3;
    input wire [7:0]input_4;
    output wire [7:0]out;
    
    reg [7:0] outreg;

    always @(*) begin
        case(select)
            2'b00: outreg <= input_1;
            2'b01: outreg <= input_2;
            2'b10: outreg <= input_3;
            2'b11: outreg <= input_4;
        endcase
    end
    assign out = outreg;
endmodule
