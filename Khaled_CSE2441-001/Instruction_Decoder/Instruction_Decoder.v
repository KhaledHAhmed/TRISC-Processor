module Instruction_Decoder(
	input w,x,y,z,
	output reg HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA);
	always @ (w,x,y,z)begin
		case ({w,x,y,z})
		4'b0000:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000000001;
		4'b0001:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000000010;
		4'b0010:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000000100;
		4'b0011:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000001000;
		4'b0100:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000010000;
		4'b0110:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000100000;
		4'b0111:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00001000000;
		4'b1000:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00010000000;
		4'b1100:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00100000000;
		4'b1001:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b01000000000;
		4'b1111:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b10000000000;
		default:{HLT,JPN,JPZ,JMP,CLR,INC,XOR,SUB,ADD,SAT,LDA}=11'b00000000000;
		
		endcase	 
	end
endmodule
	