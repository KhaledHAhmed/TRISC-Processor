module HW6_P10(
	input x, CLK, CLR,
	output reg z);
	reg [1:0]state, nextstate;
	parameter S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 3'b11;
	always @ (posedge CLK, negedge CLR)
		if (CLR == 0) state <= S3; 
		else case (state)
						S0: if (x) nextstate <= S1;else nextstate <= S3;
						S1: if (x) nextstate <= S2;else nextstate <= S3;
						S2: if (x) nextstate <= S0;else nextstate <= S3;
						S3: if (x) nextstate <= S2;else nextstate <= S1;
		endcase
	always @ (state, x)
					case (state)
							S0,S3: z = ~x;
							S1,S2: z =  x;
					endcase
endmodule 