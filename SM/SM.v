module SM(clk,EN,z);

input clk,EN;
output z;

reg z;
initial z = 1'b0;

always@(negedge clk) begin
	if(EN==1'b1) begin 
		z <= ~z; 
	end
	else begin 
		z <= z; 
	end
end
endmodule