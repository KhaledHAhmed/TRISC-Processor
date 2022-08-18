//Basic Four-bit, Four Function ALU.  Add, subtract, AND, XOR.
module BasicALU		//top level
( 
	input [3:0] A, B,	//declare data inputs
	input [1:0] S,		//declare function inputs (add: 00, subtract: 01, AND: 10, XOR: 11)
	output [3:0] R, Aout, Bout,	//declare outputs
	output OVR, Cout,					//declare overflow and carryout outputs
	output [6:0] HEX1, HEX0			//declare decimal outputs 
);	
	wire [3:0] R0, R1;				//declare internal outputs of functional units
	wire Cout0, OVR0, Cout1, OVR1;//declare internal status flags 
	assign R = S[1]==0 ? R0 : R1;				//select output results
	assign Cout = S[1]==0 ? Cout0 : Cout1;	//select carryout status
	assign OVR = S[1]==0 ? OVR0 : OVR1;		//select overflow status
//module instantiations
	AdderSubtractor AddSub
(
	.AddSub(S[0]) ,	// Add:AddSub=0, Sub:AddSub=1
	.A(A) ,				// input [3:0] A
	.B(B) ,				// input [3:0] B
	.S(R0) ,				// output [3:0] R0, output of adder subtractor
	.Cout(Cout0) ,		// output  Cout from adder subtractor
	.OVR(OVR0) 			// output  OVR from adder subtractor
);
ANDXORarray ANDXOR
(
	.A(A) ,				// input [3:0] A
	.B(B) ,				// input [3:0] B
	.S(S[0]) ,			// input  AND: S[0] = 1, XOR: S[0] = 1
	.R(R1) ,				// output [3:0] R1:  output of logic unit
	.OVR(OVR1) ,		// output  OVR1:  from logic unit
	.Cout(Cout1) 		// output  Cout1:  from logic unit
);
twoComplement2sevenS binary2two
(
	.w(R[3]) ,			// input  R[3]
	.x(R[2]) ,			// input  R[2]
	.y(R[1]) ,			// input  R[1]
	.z(R[0]) ,			// input  R[0]
	.a1(HEX1[0]) ,		// output  a1_sig
	.b1(HEX1[1]) ,		// output  b1_sig
	.c1(HEX1[2]) ,		// output  c1_sig
	.d1(HEX1[3]) ,		// output  d1_sig
	.e1(HEX1[4]) ,		// output  e1_sig
	.f1(HEX1[5]) ,		// output  f1_sig
	.g1(HEX1[6]) ,		// output  g1_sig
	.a(HEX0[0]) ,		// output  a0_sig
	.b(HEX0[1]) ,		// output  b0_sig
	.c(HEX0[2]) ,		// output  c0_sig
	.d(HEX0[3]) ,		// output  d0_sig
	.e(HEX0[4]) ,		// output  e0_sig
	.f(HEX0[5]) ,		// output  f0_sig
	.g(HEX0[6]) 		// output  g0_sig
);
endmodule 