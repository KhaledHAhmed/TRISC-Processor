//AND XOR logic unit
module ANDXOR (
	input [3:0] A, B,
	input S,
	output [3:0] R,
	output OVR, Cout
);
	assign R = S==0 ? A&B : A^B;
	assign OVR = 1'b0;
	assign Cout = 1'b0;
endmodule 