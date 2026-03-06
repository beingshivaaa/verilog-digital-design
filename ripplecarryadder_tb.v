module rca_tb;
reg [3:0] A,B;
reg Cin;
wire [3:0] sum,cout;
wire [4:0] add;//to store the concatenated cout of MSB and the 4-bit generated sum

ripple_carry_adder dut(A,B,Cin,sum,cout);
assign add= {cout[3], sum};

initial begin
$monitor("At time %0t, A=%b, B=%b, Cin=%b --> Sum=%b, CarryMSB=%b, Addition=%b",$time,A,B,Cin,sum,cout[3],add);
A=1; B=0; Cin=0; #5
A=2; B=4; Cin=1; #5
A = 4'hb; B = 4'h6; Cin = 0; #5; 
A = 5; B = 3; Cin = 1; #5; 
$finish;
end

initial begin
$dumpfile("waves.vcd");
$dumpvars;
end

endmodule

