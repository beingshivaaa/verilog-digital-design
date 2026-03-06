module fadd(
    input a,b,cin,
    output sum,cry
);

assign sum= a^b^cin;
assign cry= (a&b) | (b&cin) | (cin&a);

endmodule

module ripple_carry_adder #(parameter n=4)(
    input [n-1:0] A,B,
    input Cin,
    output [n-1:0] SUM,COUT
);


genvar g;

fadd obj1(A[0],B[0],Cin,SUM[0],COUT[0]);

generate// loop to instantiate three more full adders for three more bits
    for(g=1;g<n;g=g+1) begin
        fadd obj(A[g],B[g],COUT[g-1],SUM[g],COUT[g]);
    end
endgenerate

endmodule