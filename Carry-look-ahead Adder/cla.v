module cla #(parameter n=4)(
    input [n-1:0]A,B,
    input Cin,
    output [n-1:0] sum,
    output Cout );

wire C1,C2,C3,C4;
wire [n-1:0] G,P;

assign G=A & B;
assign P=A ^ B;

assign C1=G[0] | (P[0] & Cin);
assign C2=G[1] | (P[1] & G[0]) | (P[1]&P[0]&Cin);
assign C3=G[2] | (P[2] & G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&Cin);
assign C4=G[3] | (P[3] & G[2]) | (P[3]&P[2]&G[1]) |(P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&Cin);

assign sum[0]=P[0]^Cin;
assign sum[1]=P[1]^C1;
assign sum[2]=P[2]^C2;
assign sum[3]=P[3]^C3;

assign Cout=C4;

endmodule