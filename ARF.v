`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2023 15:12:38
// Design Name: 
// Module Name: ARF
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


module ARF(
    input [7:0] Input, 
    input [1:0] OASel,
    input [1:0] OBSel,
    input [1:0] FunSel,
    input [3:0] RSel,
    output [7:0] OutA,
    output [7:0] OutB
    );
    reg [7:0] PC, AR, SP, PCpast;
    
    reg [7:0] OAReg, OBReg;
    
    reg SET_AR, SET_SP, SET_PC, SET_PCPAST;
    
    
    always @(*) begin
        case (RSel)
            4'b0000: begin 
            end
            4'b0001: begin
            SET_PCPAST <= 1'b1;
            end
            4'b0010: begin
            SET_SP <= 1'b1;
            end
            4'b0011: begin
            SET_SP <= 1'b1;
            SET_PCPAST <= 1'b1;
            end
            4'b0100: begin
            SET_AR <= 1'b1;
            end
            4'b0101: begin
            SET_AR <= 1'b1;
            SET_PCPAST <= 1'b1;
            end
            4'b0110: begin
            SET_AR <= 1'b1;
            SET_SP <= 1'b1;
            end
            4'b0111: begin
            SET_AR <= 1'b1;
            SET_SP <= 1'b1;
            SET_PCPAST <= 1'b1;
            end       
            4'b1000: begin 
            SET_PC <= 1'b1;
            end
            4'b1001: begin
            SET_PC <= 1'b1;
            SET_PCPAST <= 1'b1;
            end
            4'b1010: begin
            SET_PC <= 1'b1;
            SET_SP <= 1'b1;
            end
            4'b1011: begin
            SET_PC <= 1'b1;
            SET_SP <= 1'b1;
            SET_PCPAST <= 1'b1;
            end
            4'b1100: begin
            SET_PC <= 1'b1;
            SET_AR <= 1'b1;
            end
            4'b1101: begin
            SET_PC <= 1'b1;
            SET_AR <= 1'b1;
            SET_PCPAST <= 1'b1;
            end
            4'b1110: begin
            SET_PC <= 1'b1;
            SET_AR <= 1'b1;
            SET_SP <= 1'b1;
            end
            4'b1111: begin
            SET_PC <= 1'b1;
            SET_AR <= 1'b1;
            SET_SP <= 1'b1;
            SET_PCPAST <= 1'b1;
            end                                                                                                                                                        
        endcase
    end
    always @(FunSel, AR, Input, posedge SET_AR) begin
        
           if (FunSel == 2'b00) begin
                AR = 8'd0;
           end
           else if (FunSel == 2'b01) begin
                AR = Input;
           end
           else if (FunSel == 2'b10) begin
                AR = AR - 8'd1;
           end     
           else if (FunSel == 2'b11) begin
                AR = AR + 8'd1;
           end  
        SET_AR  <= 1'b0;
    end
    always @(FunSel, SP, Input, posedge SET_SP) begin
            if (FunSel == 2'b00) begin
                SP = 8'd0;
                end
           else if (FunSel == 2'b01) begin
                SP = Input;
                end
           else if (FunSel == 2'b10) begin
                SP = SP - 8'd1;
                end     
           else if (FunSel == 2'b11) begin
                SP = SP + 8'd1;
                end 
        SET_SP  <= 1'b0; 
    end
    always @(FunSel, PCpast, Input, posedge SET_PCPAST) begin
            if (FunSel == 2'b00) begin
                PCpast = 8'd0;
                end
           else if (FunSel == 2'b01) begin
                PCpast = Input;
                end
           else if (FunSel == 2'b10) begin
                PCpast = PCpast - 8'd1;
                end     
           else if (FunSel == 2'b11) begin
                PCpast = PCpast + 8'd1;
                end  
        SET_PCPAST  <= 1'b0; 
    end
    always @(FunSel, PC, Input, SET_PC) begin
            if (FunSel == 2'b00) begin
                PC = 8'd0;
                end
           else if (FunSel == 2'b01) begin
                PC = Input;
                end
           else if (FunSel == 2'b10) begin
                PC = PC - 8'd1;
                end     
           else if (FunSel == 2'b11) begin
                PC = PC + 8'd1;
                end  
        SET_PC  <= 1'b0;
    end
    
    always @ (OASel or PC or AR or SP or PCpast) begin
        case (OASel)
            2'b00: OAReg = AR;
            2'b01: OAReg = SP;
            2'b10: OAReg = PCpast;
            2'b11: OAReg = PC;
        endcase
    end
    always @ (OBSel or PC or AR or SP or PCpast) begin
        case (OBSel)
            2'b00: OBReg = AR;
            2'b01: OBReg = SP;
            2'b10: OBReg = PCpast;
            2'b11: OBReg = PC;
        endcase
    end
    
    assign OutA = OAReg;
    assign OutB = OBReg;
    
endmodule
