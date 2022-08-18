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
	
//	FullAdder s0 (A[0], B0, C0  , S[0], C[1]);  // stage 0
//	FullAdder s1 (A[1], B1, C[1], S[1], C[2]);  // stage 1
//	FullAdder s2 (A[2], B2, C[2], S[2], C[3]);  // stage 2
//	FullAdder s3 (A[3], B3, C[3], S[3], C[4]);  // stage 3

	//FAbehav s0 (.ai(A[0]), .bi(B0), .cini(C0)  , .si(S[0]), .couti(C[1])); //stage 0
	FAbehav s0 (.bi(B0), .ai(A[0]), .cini(C0)  , .si(S[0]), .couti(C[1])); //stage 0// BY NAME
	FAbehav s1 (.ai(A[1]), .bi(B1), .cini(C[1]), .si(S[1]), .couti(C[2])); //stage 1
	FAbehav s2 (.ai(A[2]), .bi(B2), .cini(C[2]), .si(S[2]), .couti(C[3])); //stage 2
	FAbehav s3 (.ai(A[3]), .bi(B3), .cini(C[3]), .si(S[3]), .couti(C[4])); //stage 3
		
		assign Cout = C[4];  // rename carry-out port
		
endmodule
