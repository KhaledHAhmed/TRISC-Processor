//Ripple Carry Adder Structural Model

module AdderSubtractor (   // name the module
	input [3:0] A, B, 		// declare input ports
	output V,               // OverFlow
	input C0,              // if C0 = 0 Add, else if c0 = 1 subtract
	output [3:0] S,			// declare output ports for sum
	output Cout); 				// declare carry-out port
	wire [4:1] C;           // declare internal nets
	wire  B0; 
	wire  B1;
	wire  B2;
	wire  B3;
		
		xor(B0, C0, B[0]);
		xor(B1, C0, B[1]);
		xor(B2, C0, B[2]);
		xor(B3, C0, B[3]);
		xor(V, C[3], C[4]);
		
	//instantiate the full adder module for each stage of the ripple carry adder
	
	FullAdder s0 (A[0], B0, C0  , S[0], C[1]);  // stage 0
	FullAdder s1 (A[1], B1, C[1], S[1], C[2]);  // stage 1
	FullAdder s2 (A[2], B2, C[2], S[2], C[3]);  // stage 2
	FullAdder s3 (A[3], B3, C[3], S[3], C[4]);  // stage 3
		
		assign Cout = C[4];  // rename carry-out port
		
endmodule
