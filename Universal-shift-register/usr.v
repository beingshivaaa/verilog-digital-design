module usr(
    input [3:0] p_din, input [1:0] sel, 
    input sir, // serial input for right shift
    input sil, // serial input for left shift
    input clr_n,input clk,
    output reg [3:0] p_dout,
    output s_left_dout,// serial left data out
    output s_right_dout //serial right data out
); 

always@(posedge clk) begin //synchronous clear

if(!clr_n) begin
p_dout<=4'b0000;
end

else begin
case(sel)

2'b01: p_dout<= {sir,p_dout[3:1]}; //shift right data
2'b10: p_dout<= {p_dout[2:0],sil}; //shift left data
2'b11: p_dout<=p_din; //Load data in a parallel manner

default: p_dout<=p_dout; //do nothing
endcase
end

end

assign s_left_dout=p_dout[0];
assign s_right_dout=p_dout[3];

endmodule
