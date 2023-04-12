`timescale 1ns / 1ps

module general_reg_8_bit(
    input [7:0] Input, 
    input [2:0] O1Sel,
    input [2:0] O2Sel,
    input [1:0] FunSel,
    input [3:0] RSel,
    input [3:0] TSel,
    output [7:0] Output1,
    output [7:0] Output2
    );
    reg [7:0] R1, R2, R3, R4;
    reg [7:0] T1, T2, T3, T4;
    reg [7:0] O1Reg, O2Reg;
    reg [7:0] SET_R1, SET_R2, SET_R3, SET_R4, SET_T1, SET_T2, SET_T3, SET_T4;   
   

 always @(FunSel, R1, Input, posedge SET_R1) begin
        
           if (FunSel == 2'b00) begin
                R1 = 8'd0;
           end
           else if (FunSel == 2'b01) begin
                R1 = Input;
           end
           else if (FunSel == 2'b10) begin
                R1 = R1 - 8'd1;
           end     
           else if (FunSel == 2'b11) begin
                R1 = R1 + 8'd1;
           end  
        R1  <= 1'b0;
    end

   always @(FunSel, R2, Input, posedge SET_R2) begin
        
    if (FunSel == 2'b00) begin
        R2 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        R2 = Input;
    end
    else if (FunSel == 2'b10) begin
        R2 = R2 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        R2 = R2 + 8'd1;
    end  
    R2 <= 1'b0;
end

always @(FunSel, R3, Input, posedge SET_R3) begin
        
    if (FunSel == 2'b00) begin
        R3 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        R3 = Input;
    end
    else if (FunSel == 2'b10) begin
        R3 = R3 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        R3 = R3 + 8'd1;
    end  
    R3 <= 1'b0;
end

always @(FunSel, R4, Input, posedge SET_R4) begin
        
    if (FunSel == 2'b00) begin
        R4 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        R4 = Input;
    end
    else if (FunSel == 2'b10) begin
        R4 = R4 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        R4 = R4 + 8'd1;
    end  
    R4 <= 1'b0;
end

always @(FunSel, T1, Input, posedge SET_T1) begin
        
    if (FunSel == 2'b00) begin
        T1 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        T1 = Input;
    end
    else if (FunSel == 2'b10) begin
        T1 = T1 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        T1 = T1 + 8'd1;
    end  
    T1 <= 1'b0;
end

always @(FunSel, T2, Input, posedge SET_T2) begin
        
    if (FunSel == 2'b00) begin
        T2 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        T2 = Input;
    end
    else if (FunSel == 2'b10) begin
        T2 = T2 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        T2 = T2 + 8'd1;
    end  
    T2 <= 1'b0;
end

always @(FunSel, T3, Input, posedge SET_T3) begin
        
    if (FunSel == 2'b00) begin
        T3 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        T3 = Input;
    end
    else if (FunSel == 2'b10) begin
        T3 = T3 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        T3 = T3 + 8'd1;
    end  
    T3 <= 1'b0;
    end
    
    always @(FunSel, T4, Input, posedge SET_T4) begin
    if (FunSel == 2'b00) begin
        T4 = 8'd0;
    end
    else if (FunSel == 2'b01) begin
        T4 = Input;
    end
    else if (FunSel == 2'b10) begin
        T4 = T4 - 8'd1;
    end     
    else if (FunSel == 2'b11) begin
        T4 = T4 + 8'd1;
    end  
    T4 <= 1'b0;
    end

  
  always @ (O1Sel or R1 or R2 or R3 or R4 or T1 or T2 or T3 or T4) begin
        case (O1Sel)
          3'b000: O1Reg = T1;
          3'b001: O1Reg = T2;
          3'b010: O1Reg = T3;
          3'b011: O1Reg = T4;
          3'b100: O1Reg = R1;
          3'b101: O1Reg = R2;
          3'b110: O1Reg = R3;
          3'b111: O1Reg = R4;
        endcase
      end
      
       
         always @ (O2Sel, R1, R2, R3, R4, T1, T2, T3, T4) begin
           case (O2Sel)
             3'b000: O2Reg = T1;
             3'b001: O2Reg = T2;
             3'b010: O2Reg = T3;
             3'b011: O2Reg = T4;
             3'b100: O2Reg = R1;
             3'b101: O2Reg = R2;
             3'b110: O2Reg = R3;
             3'b111: O2Reg = R4;
           endcase
         end
        
         assign Output1 = O1Reg;
         assign Output2 = O2Reg;
endmodule
