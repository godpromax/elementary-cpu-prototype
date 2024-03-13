module RS (
    input fbus, flbus, frbus,
    input [7:0] a,
    output reg [7:0] w,
    output reg cf
);

    always @(a, fbus, flbus, frbus) begin
		w = 8'hZZ;
		cf = 1'b0;
		
        if (fbus == 1'b1) begin
            w = a;
        end
        else if (flbus == 1'b1) begin
            w = {a[6:0], a[7]};
            cf = a[7];
        end
        else if (frbus == 1'b1) begin
            w = {a[0], a[7:1]};
            cf = a[0];
        end
    end

endmodule