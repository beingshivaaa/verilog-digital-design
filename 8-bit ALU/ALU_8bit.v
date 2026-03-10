module ALU_8bit(
    input [7:0] A,
    input [7:0] B,
    input [3:0] ctrl_sig,
    output reg [7:0] result,
    output zero
);

always@(*) begin
case(ctrl_sig)
    4'b0001: result=A - B; //subtraction
    4'b0000: result=A + B; //sum
    4'b0010: result=A & B; //And
    4'b0011: result=A | B; //OR
    4'b0100: result=A ^ B; //XOR
    4'b0101: result=A << 1;//Shift left logical
    4'b0110: result=A >> 1;//Shift right logical
    4'b0111: result=(A < B) ? 8'b00000001:8'b00000000; //SLT(Shift less than)

endcase
end

assign zero= (result==8'b00000000);

endmodule

