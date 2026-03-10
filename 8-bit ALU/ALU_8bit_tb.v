module ALU_8bit_tb;
reg [7:0] A,B;
reg [3:0] ctrl_sig;
wire [7:0] result;
wire zero;// the zero flag

ALU_8bit dut(A,B,ctrl_sig,result,zero);//instantiation

initial begin
$dumpfile("ALU.vcd");
$dumpvars;

A=8'd10;
B=8'd5;

$monitor("At time %0t, control_inp=%b -> A=%b  B=%b result=%b",$time,ctrl_sig,A,B,result);
#10 ctrl_sig = 4'b0000;   // ADD
#10 ctrl_sig = 4'b0001;   // SUB
#10 ctrl_sig = 4'b0010;   // AND
#10 ctrl_sig = 4'b0011;   // OR
#10 ctrl_sig = 4'b0100;   // XOR
#10 ctrl_sig = 4'b0101;   // SLL
#10 ctrl_sig = 4'b0110;   // SRL
#10 ctrl_sig = 4'b0111;   // SLT

#10 A = 8'd5; B = 8'd5; ctrl_sig = 4'b0001; // zero flag test

#20 $finish;
end

endmodule

