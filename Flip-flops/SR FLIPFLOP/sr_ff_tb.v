module sr_ff_tb;
reg s,r;
reg clk,rst_n;
wire q,q_bar;

sr_ff dut(s,r,clk,rst_n,q,q_bar); //instantiation

 always #2 clk = ~clk; //clock of period=4 units

  initial begin 
    clk = 0; rst_n = 0; 
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar); 
    #3 rst_n = 1; 
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar); 
     
    drive(2'b00); 
    drive(2'b01); 
    drive(2'b10); 
    drive(2'b11); 
    #5; 
    $finish; 
  end 
   
  task drive;
  input [1:0] ip;
  begin
    {s,r} = ip; 
    @(posedge clk); 
    #1 $display("s=%b, r=%b --> q=%b, q_bar=%b",s, r, q, q_bar);
    end 
  endtask 
   
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1); 
  end 
endmodule