module ALU(M,se,S,D,T,Cf,Zf);
input M;
input [3:0]se;
input [7:0]S,D;
output [7:0]T;
output Cf, Zf;

reg [7:0]T;
reg Cf,Zf;

always@(M,se,S,D)
begin
Cf=1'b0;
	T = 8'h00;
	Zf = 1'b0;
	if(M==1'b0) 
	begin
		T = S;
	end
	if(M==1'b1)
	begin
		if(se==4'b1001)
		begin 
			{Cf,T} = S+D;
			if(Cf==1'b0&&T==8'h00)
				begin Zf = 1'b1; end
		end
		else if(se==4'b0110)
		begin
			{Cf,T} = D-S;
			if(Cf==1'b0&&T==8'h00)
				begin Zf = 1'b1; end
		end
		else if(se==4'b1011)
		begin
			{Cf,T} = S&D;
		end
		else if(se==4'b0101)
		begin 
			T = ~D;
		end
		else if(se==4'b1010||se==4'b0100)
			begin T = D; end
		else if(se==4'b1100)
			begin T = S; end
	end
end
endmodule