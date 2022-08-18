module HW6_P9(
	input x, CLK, CLR,
	output reg z	);
	reg state;

	parameter A =2'b00,B = 2'b01,C = 2'b10,D = 3'b11;
	always @ (posedge CLK, negedge CLR)
		if (CLR == 0) state <= A;
		else case (state)
						A: if (x) state <= B;else state <= A;
						B: if (x) state <= B;else state <= C;
						C: if (x) state <= B;else state <= D;
						D: if (x) state <= B;else state <= A;
		endcase
	always @ (state, x)
					case (state)
							A,C: z = 1;
							B,D: z = 0;
					endcase
endmodule 