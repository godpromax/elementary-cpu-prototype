module Reg (
    input clk,we,
    input [1:0] RSA,RWDA,
    input [7:0] i,
    output reg[7:0] S,D
);
reg[7:0] A=8'b0000_0001,B=8'b0000_0010,C=8'b1000_0000; 
parameter a=2'b00,b=2'b01,c=2'b10;   
always @(RSA or RWDA or A or B or C) begin
    case (RSA)
    a:begin S=A;end
    b:begin S=B;end
    c:begin S=C;end
    default:begin S=C;end
    endcase
    case (RWDA)
    a:begin D=A;end
    b:begin D=B;end
    c:begin D=C;end
    default:begin D=C;end
    endcase
end
always @(negedge clk) begin
    if(we==1'b0)begin
        case (RWDA)
        a:begin A<=i;end
        b:begin B<=i;end
        c:begin C<=i;end
        default:begin C<=i;end
        endcase
    end
    else begin A<=A;end//it iS uSeleSS
end
endmodule