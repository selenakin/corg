`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2023 16:55:26
// Design Name: 
// Module Name: nbit_reg
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


module nbit_reg#(parameter n=8) (
    input E,
    input [1:0] FunSel,
    input [n-1:0] I,
    output [n-1:0] Q
    );

  reg [n-1:0] reg_data;

  //run this block only when E is high
    always @(E, I, FunSel) begin
        if (E == 1) begin
            if (FunSel == 8'b00) begin
                //load n-bit 0 into the register
                reg_data <= 0;
            end
            else if (FunSel == 2'b01) begin
            reg_data <= I;
            end
            else if (FunSel == 2'b10) begin
            reg_data <= reg_data - 1;
            end
            else if (FunSel == 2'b11) begin
            reg_data <= reg_data +  1 ;
            end
        end
        else begin
            reg_data <= reg_data;
        end
    end
    assign Q = reg_data;
endmodule