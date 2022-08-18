module ControllerFSM (SysClock,StartStop,INC,CLR,JMP,C0,C1,C2,C3,C4,C7,C8,C9);
	input SysClock,StartStop,INC,CLR,JMP;
	output reg C0,C1,C2,C3,C4,C7,C8,C9;
	reg[2:0] state,nextstate;
	parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b110,G=3'b101,H=3'b111;
		always @ (negedge SysClock, negedge StartStop)
			if(StartStop == 1'b0) state <= A;else state <= nextstate;
		always @ (state,INC,CLR,JMP)
			case(state)
				A:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b10000000;nextstate = B; end
				B:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00010000;nextstate = C; end
				C:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00001000;nextstate = D; end
				D:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00001000;nextstate = E; end
				E:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00100100;
					if(INC) nextstate = F;
						else if (CLR) nextstate = G;
							else if (JMP) nextstate = H; end
				F:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00000001;nextstate = B; end
				G:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00000010;nextstate = B; end
				H:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b01000000;nextstate = B; end
				default:begin {C0,C1,C2,C3,C4,C7,C8,C9} = 8'b00000000;nextstate = A; end
				
			endcase
endmodule
