module sr_ff(input s,r,clk,rst_n,
output reg q,
output q_bar);

always@(posedge clk) begin
if(!rst_n) q<=0; //reset asserted
else begin

case({s,r})
2'b00: q<=q; //Hold state
2'b01: q<=1'b0;//reset
2'b10: q<=1'b1;//set
2'b11: q<=1'bx; //invalid state
endcase
end

end

assign q_bar=!q;
endmodule
