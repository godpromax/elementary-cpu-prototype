module CTRL (
    input mova, movb, movc, add, sub, and1, not1, rsr, rsl, jmp, jz, jc, in1, out1, nop, halt, z ,c , 
    input [7:0] in,
    input sm,
    output reg [1:0] reg_ra, reg_wa, madd,
    output reg [3:0] alu_s,
    output reg pc_ld, pc_inc, reg_we, ram_xl, ram_dl, alu_m, fbus, flbus, frbus, ir_ld, cf_en, zf_en, sm_en, in_en, out_en
);

    always @(mova, movb, movc, add, sub, and1, not1, rsr, rsl, jmp, jz, z, jc, c, in1, out1, nop, halt, sm, in) begin     
        reg_ra = in[1:0];
        reg_wa = in[3:2];
        reg_we = ~sm|out1|movb|jmp|jc|jz|halt|nop;

        madd = {movb, movc};
        alu_s = in[7:4];
        alu_m = add|sub|not1|and1|rsr|rsl|out1;
        cf_en = add|sub|rsr|rsl;
        zf_en = add|sub;
        sm_en = ~halt;
        in_en = in1;
        out_en = out1;  
        fbus = add|sub|and1|not1|out1|mova|movb;
        flbus = rsl;
        frbus = rsr;
        ir_ld = ~sm;
        pc_inc = ~sm|(jz&~z)|(jc&~c);
        pc_ld = jmp|(jz&z)|(jc&c);
        ram_xl = movb;
        ram_dl = movc|jmp|(jz&z)|(jc&c)|~sm;
    end  
endmodule