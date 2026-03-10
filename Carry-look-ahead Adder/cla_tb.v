module cla_tb;

reg [3:0] A,B;
reg Cin;
wire [3:0] sum;
wire Cout;

cla dut(A,B,Cin,sum,Cout);

initial begin
$dumpfile("cla.vcd");
$dumpvars;

$monitor("A=%b , B=%b  Sum=%b, Carry=%b",A,B,sum,Cout);

A=4'b0000; B=4'b0000; Cin=0;

#10 A=4'b0011; B=4'b0101; Cin=0;
#10 A=4'b0110; B=4'b0011; Cin=1;
#10 A=4'b1111; B=4'b0001; Cin=1;

#10 $finish;

end
endmodule
