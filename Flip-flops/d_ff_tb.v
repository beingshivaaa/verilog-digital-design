module d_ff_tb;
reg clk,d,rst_n;
reg q;

d_ff dut(clk,d,rst_n,q);//instantiation

always #2  clk=~clk;//clock of time period=4 units
initial begin

clk=0; 
rst_n=0; //means reset is asserted(active low)
d=0;

#3 rst_n=1; //reset is released

repeat(3) begin
d=$urandom_range(0,1);
#3;
end

rst_n=0;#3;
rst_n=1;

repeat(3) begin
d=$urandom_range(0,1);
#3;
end

$finish; //end the simulation

end

initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1); 
end 
endmodule
