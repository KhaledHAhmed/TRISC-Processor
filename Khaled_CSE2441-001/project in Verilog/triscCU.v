//TRISC Control Unit for instructions LDA, STA, ADD, INC, CLR, and JMP.
module triscCU
(
	input SysClock, StartStop,
	input [3:0] IR,
	output [3:0] IRout,
	output [14:0] C
);
	wire LDA,STA,ADD,SUB,XOR,INC,CLR,JMP,JPZ,JPN,HLT;
assign IRout = IR;

triscID ID
(
	.IR(IR) ,			// input [3:0] IR_sig
	.LDA(LDA) ,			// output  LDA instruction
	.STA(STA) ,			// output  STA instruction
	.ADD(ADD) ,			// output  ADD instruction
	.SUB(SUB) ,			// output  SUB instruction
	.XOR(XOR) ,			// output  XOR instruction
	.INC(INC) ,			// output  INC instruction
	.CLR(CLR) ,			// output  CLR instruction
	.JMP(JMP) ,			// output  JMP instruction
	.JPZ(JPZ) ,			// output  JPZ instruction
	.JPN(JPN) ,			// output  JPN instruction
	.HLT(HLT) 			// output  HLT instruction
);

triscFSM triscFSM_inst
(
	.SysClock(SysClock) ,			// input  System Clock
	.StartStop(StartStop) ,			// input  Start and Stop
	.LDA(LDA) ,			// input  LDA instruction
	.STA(STA) ,			// input  STA instruction
	.ADD(ADD) ,			// input  ADD instruction
	.SUB(SUB) ,			// input  SUB instruction
	.XOR(XOR) ,			// input  XOR instruction
	.INC(INC) ,			// input  INC instruction
	.CLR(CLR) ,			// input  CLR instruction
	.JMP(JMP) ,			// input  JMP instruction
	.JPZ(JPZ) ,			// input  JPZ instruction
	.JPN(JPN) ,			// input  JPN instruction
	.HLT(HLT) ,			// input  HLT instruction
	.C0(C[0]) ,			// output  control C0
	.C1(C[1]) ,			// output  control C1
	.C2(C[2]) ,			// output  control C2
	.C3(C[3]) ,			// output  control C3
	.C4(C[4]) ,			// output  control C4
	.C7(C[7]) ,			// output  control C7
	.C8(C[8]) ,			// output  control C8
	.C9(C[9]) ,			// output  control C9
	.C5(C[5]) ,			// output  control C5
	.C10(C[10]) ,		// output  control C10
	.C11(C[11]) ,		// output  control C11
	.C12(C[12]) ,		// output  control C12
	.C13(C[13]) ,		// output  control C13
	.C14(C[14]) 		// output  control C14
);
endmodule 