module PC(LD_PC, IN_PC,clk,a,c);

input LD_PC, IN_PC,clk;
input [7:0] a;
output [7:0] c;

reg [7:0]address;

initial address = 8'h00;
always@(negedge clk) begin 
	if(IN_PC == 1'b1 && LD_PC == 1'b0) begin
		address = address+8'h01;
	end
	else if(LD_PC==1'b1&&IN_PC== 1'b0) begin
		address = a; 
	end
end
assign c = address;
endmodule