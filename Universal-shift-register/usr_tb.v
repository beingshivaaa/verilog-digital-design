module usr_tb;

    reg clr_n, clk;
    reg [3:0] p_din; reg [1:0] sel; 
    reg sir; 
    reg sil; 
    wire reg [3:0] p_dout;
    wire s_left_dout;
    wire s_right_dout; 

    usr dut(p_din,sel,sir,sil,clr_n,clk,p_dout,s_left_dout,s_right_dout);//Instantiation

always #2 clk=~clk;
initial begin

$dumpfile("usr.vcd");
$dumpvars;

$monitor("select=%b, p_din=%b, sil=%b, sir=%b --> p_dout = %b, s_left_dout = %b, s_right_dout = %b ",sel, p_din, sil, 
sir, p_dout, s_left_dout, s_right_dout);

clk=0; clr_n=0;
#3 clr_n=1;

p_din = 4'b1101; 
sil = 1'b1; 
sir = 1'b0; 
     
sel = 2'h3; #10; 
sel = 2'h1; #20; 
p_din = 4'b1101; 
sel = 2'h3; #10; 
sel = 2'h2; #20; 
sel = 2'h0; #20;

$finish;
end

endmodule