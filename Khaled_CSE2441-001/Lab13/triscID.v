module triscID
(
	input [3:0] IR,
	output LDA,STA,ADD,SUB,XOR,INC,CLR,JMP,JPZ,JPN,HLT
);
	reg [10:0] ID;
	always @ (IR)
	case ({IR})
		4'b0000: {ID} = 11'b10000000000;//LDA
		4'b0001: {ID} = 11'b01000000000;//STA
		4'b0010: {ID} = 11'b00100000000;//ADD
		4'b0011: {ID} = 11'b00010000000;//SUB
		4'b0100: {ID} = 11'b00001000000;//XOR
		4'b0110: {ID} = 11'b00000100000;//INC
		4'b0111: {ID} = 11'b00000010000;//CLR
		4'b1000: {ID} = 11'b00000001000;//JMP
		4'b1100: {ID} = 11'b00000000100;//JPZ
		4'b1001: {ID} = 11'b00000000010;//JPN
		4'b1111: {ID} = 11'b00000000001;//HLT
		default: {ID} = 11'b00000000000;//Default
	endcase
	assign {LDA,STA,ADD,SUB,XOR,INC,CLR,JMP,JPZ,JPN,HLT} = {ID};
endmodule