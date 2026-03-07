module d_ff(input clk,d,rst_n,
output reg q);
/*assuming an active low reset and a positive edge clock */

always@(posedge clk or negedge rst_n) begin
if(!rst_n) q<=0;
else q<=d;
end

endmodule