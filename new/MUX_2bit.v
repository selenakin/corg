`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2023 14:51:08
// Design Name: 
// Module Name: MUX_2bit
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


module MUX_2bit (
    select,
    input_1,
    input_2,
    out
);
    input wire select;
    input wire [7:0]input_1;
    input wire [7:0]input_2;
    output wire [7:0]out;
    
    reg [7:0] outreg;

    always @(*) begin
        case(select)
            1'b0: outreg <= input_1;
            1'b1: outreg <= input_2;
        endcase
    end
    assign out = outreg;
endmodule
