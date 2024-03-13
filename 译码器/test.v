module test (EN,IR,MOVA,MOVB,MOVC,ADD,SUB,AND,NOT,RSR,RSL,JMP,JZ,JC,IN,OUT,NOP,HALT);
    input EN;
    input [7:0] IR;
    output MOVA,MOVB,MOVC,ADD,SUB,AND,NOT,RSR,RSL,JMP,JZ,JC,IN,OUT,NOP,HALT;
    reg [3:0] prev;
    reg [1:0] r1,r2; //divide input into 3 parts
    reg MOVA,MOVB,MOVC,ADD,SUB,AND,NOT,RSR,RSL,JMP,JZ,JC,IN,OUT,NOP,HALT;
    always @(EN,IR)
    begin
        prev=IR[7:4];
        r1=IR[3:2];
        r2=IR[1:0];  
    MOVA=1'b0;
    MOVB=1'b0;
    MOVC=1'b0;
    ADD=1'b0;
    SUB=1'b0;
    AND=1'b0;
    NOT=1'b0;
    RSR=1'b0;
    RSL=1'b0;
    JMP=1'b0;
    JZ=1'b0;
    JC=1'b0;
    IN=1'b0;
    OUT=1'b0;
    NOP=1'b0;
    HALT=1'b0;
    if(EN==1'b1)
    begin
        if(prev==4'b1100) //MOVE
        begin
            if(r2==2'b11)
                begin MOVC=1'b1;end
            else if(r1==2'b11)
                begin MOVB=1'b1;end
            else
                begin MOVA=1'b1;end
        end
        else if(prev==4'b1001) //ADD
            begin ADD=1'b1;end
        else if(prev==4'b0110)    //SUB
			begin SUB = 1'b1;end
		else if(prev==4'b1011)	  //AND
			begin AND = 1'b1;end
		else if(prev==4'b0101)	  //NOT
			begin NOT = 1'b1;end
		else if(prev==4'b1010)    //RS
        begin
            if(r2==2'b00)
                begin RSR=1'b1;end                
            else if(r2==2'b11)
                    begin RSL=1'b1;end
        end
        else if(prev==4'b0011) //jump
        begin
            if(r2==2'b00)
                begin JMP=1'b1;end
           else if(r2==2'b01)
			    begin JZ = 1'b1;  end
		    else if(r2==2'b10)
			    begin JC = 1'b1;  end
	    end
        else if(prev==4'b0010)	 //IN
		    begin IN = 1'b1;  end
	    else if(prev==4'b0100)	 //OUT
		    begin OUT = 1'b1; end
        else if(prev==4'b0111) //NOP
            begin NOP = 1'b1; end
        else if(prev==4'b1000)   //HALT
		    begin HALT = 1'b1; end
	end		
end
endmodule