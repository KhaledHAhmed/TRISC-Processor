module TRISC2
	(
	input SysClock, StartStop, ClearAddGen,	//SysClock = Key1, StartStop = Key0, ClearAddGen = Key3
	input Mode, ClockIn, RW,						//Mode = SW9, ClockIn = Key2, RW = Key5
	input [7:0] DataIn,								//DataIn = {SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0}
	output [9:0] LEDR, LEDG,
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0
	);
	wire [7:0] MDI, MDO;
	wire [3:0] AddBus, RAMadd, IR, R, BR, hex5in, hex4in, hex3in, hex2in, hex1in, hex0in;
	wire [3:0] AddIn, AddGen;
	wire [13:0] CBus;
	wire c0,c1,c2,c3,c4,c5,c7,c8,c9,c10,c11,c12,c13,c14,OVR,Cout;
	wire RAMin, RAMwrite, toggle;
	wire [7:0] RAMdata;
	
	assign LEDG[0] = c0; assign LEDG[1] = c1; assign LEDG[2] = c2; assign LEDG[3] = c3; assign LEDG[4] = c4; assign LEDG[5] = c5; assign LEDG[6] = c7; assign LEDG[7] = c8; assign LEDG[8] = c9; assign LEDG[9] = c10;
	assign LEDR[9] = c14; assign LEDR[8] = c13; assign LEDR[7] = c12; assign LEDR[6] = c11; 
	assign c0=CBus[0]; assign c1=CBus[1]; assign c2=CBus[2]; assign c3=CBus[3]; assign c4=CBus[4]; assign c5=CBus[5]; assign c7=CBus[6]; assign c8=CBus[7]; assign c9=CBus[8]; assign c10=CBus[9]; assign c11=CBus[10]; assign c12=CBus[11]; assign c13=CBus[12]; assign c14=CBus[13]; 
	assign RAMadd = c3==0 ? MDO[3:0] : AddBus;
	assign hex5in = AddBus; assign hex4in = AddIn; assign hex3in = MDO[7:4]; assign hex2in = MDO[3:0]; assign hex1in = RAMdata[7:4]; assign hex0in = RAMdata[3:0];
	assign LEDR[0] = Mode;
	
	assign AddIn = Mode == 1'b0 ? RAMadd : AddGen;
	assign RAMin = Mode == 1'b0 ? SysClock*c4 : ClockIn;
	assign RAMdata = Mode == 1'b0 ? MDI : DataIn;
	assign RAMwrite = Mode == 1'b0 ? c5 : ~RW;
	
// module instantiations

OnOffToggle DivideX2
(
	.OnOff(ClockIn) ,					// input  OnOff_sig
	.IN(1'b1) ,							// input  IN_sig
	.OUT(toggle) 						// output  OUT_sig
);

BinUp AddressGen
(
	.inc(toggle) ,						// input  inc_sig
	.clear(ClearAddGen) ,			// input  clear_sig
	.load(1'b1) ,						// input  load_sig
	.D(4'b0) ,							// input  [N-1:0] D_sig
	.Q(AddGen) 							// output [N-1:0] Q_sig
);

triscRAM	RAM
(
	.address ( AddIn ),
	.clock ( ~RAMin ),
	.data ( RAMdata ),
	.wren ( RAMwrite ),
	.q ( MDO )
);

BinUp PC
(
	.inc(~c2) ,							// input  inc_sig
	.clear(~c0) ,						// input  clear_sig
	.load(~c1) ,						// input  load_sig
	.D(MDO[3:0]) ,						// input  [N-1:0] D_sig
	.Q(AddBus) 							// output [N-1:0] Q_sig
);
	
PIPOreg IReg
(
	.D(MDO[7:4]) ,						// input  [N-1:0] D_sig
	.Load(~c7) ,						// input  Load_sig
	.Clear(StartStop) ,				// input  Clear_sig
	.Q(IR) 								// output [N-1:0] Q_sig
);

Acc ACC
(
	.clear(~c8) ,						// input  clear_sig
	.load(~c11) ,						// input  load_sig
	.inc(~c9) ,							// input  inc_sig
	.AB(c10) ,							// input  AB_sig
	.A(MDO[3:0]) ,						// input  [3:0] A_sig
	.B(BR) ,								// input  [3:0] B_sig
	.Z(MDI[3:0]) 						// output [3:0] Z_sig
);
	
PIPOreg BReg
(
	.D(R) ,								// input  [N-1:0] D_sig
	.Load(~c14) ,						// input  Load_sig
	.Clear(StartStop) ,				// input  Clear_sig
	.Q(BR) 								// output [N-1:0] Q_sig
);

BasicALU ALU
(
	.A(MDI[3:0]) ,						// input  [3:0] A_sig
	.B(MDO[3:0]) ,						// input  [3:0] B_sig
	.S({c12,c13}) ,					// input  [1:0] S_sig
	.R(R) ,								// output [3:0] R_sig
	.OVR(OVR) ,							// output OVR_sig
	.Cout(Cout)		 					// output Cout_sig
);

triscCU CU
(
	.SysClock(~SysClock) ,			// input  SysClock_sig
	.StartStop(StartStop) ,			// input  StartStop_sig
	.IR(IR) ,							// input  [3:0] IR_sig
	.C(CBus) 							// output [14:0] C_sig
);

//HEX driver instantiations	
	binary2seven hex5
(
	.w(hex5in[3]),			// input  w_sig
	.x(hex5in[2]),			// input  x_sig
	.y(hex5in[1]),			// input  y_sig
	.z(hex5in[0]),			// input  z_sig
	.a(HEX5[0]),			// output  a_sig
	.b(HEX5[1]),			// output  b_sig
	.c(HEX5[2]),			// output  c_sig
	.d(HEX5[3]),			// output  d_sig
	.e(HEX5[4]),			// output  e_sig
	.f(HEX5[5]),			// output  f_sig
	.g(HEX5[6]) 			// output  g_sig
);
binary2seven hex4
(
	.w(hex4in[3]) ,		// input  w_sig
	.x(hex4in[2]) ,		// input  x_sig
	.y(hex4in[1]) ,		// input  y_sig
	.z(hex4in[0]) ,		// input  z_sig
	.a(HEX4[0]) ,			// output  a_sig
	.b(HEX4[1]) ,			// output  b_sig
	.c(HEX4[2]) ,			// output  c_sig
	.d(HEX4[3]) ,			// output  d_sig
	.e(HEX4[4]) ,			// output  e_sig
	.f(HEX4[5]) ,			// output  f_sig
	.g(HEX4[6]) 			// output  g_sig
);
binary2seven hex3
(
	.w(hex3in[3]) ,		// input  w_sig
	.x(hex3in[2]) ,		// input  x_sig
	.y(hex3in[1]) ,		// input  y_sig
	.z(hex3in[0]) ,		// input  z_sig
	.a(HEX3[0]) ,			// output  a_sig
	.b(HEX3[1]) ,			// output  b_sig
	.c(HEX3[2]) ,			// output  c_sig
	.d(HEX3[3]) ,			// output  d_sig
	.e(HEX3[4]) ,			// output  e_sig
	.f(HEX3[5]) ,			// output  f_sig
	.g(HEX3[6]) 			// output  g_sig
);
binary2seven hex2
(
	.w(hex2in[3]) ,		// input  w_sig
	.x(hex2in[2]) ,		// input  x_sig
	.y(hex2in[1]) ,		// input  y_sig
	.z(hex2in[0]) ,		// input  z_sig
	.a(HEX2[0]) ,			// output  a_sig
	.b(HEX2[1]) ,			// output  b_sig
	.c(HEX2[2]) ,			// output  c_sig
	.d(HEX2[3]) ,			// output  d_sig
	.e(HEX2[4]) ,			// output  e_sig
	.f(HEX2[5]) ,			// output  f_sig
	.g(HEX2[6]) 			// output  g_sig
);
binary2seven hex1
(
	.w(hex1in[3]) ,		// input  w_sig
	.x(hex1in[2]) ,		// input  x_sig
	.y(hex1in[1]) ,		// input  y_sig
	.z(hex1in[0]) ,		// input  z_sig
	.a(HEX1[0]) ,			// output  a_sig
	.b(HEX1[1]) ,			// output  b_sig
	.c(HEX1[2]) ,			// output  c_sig
	.d(HEX1[3]) ,			// output  d_sig
	.e(HEX1[4]) ,			// output  e_sig
	.f(HEX1[5]) ,			// output  f_sig
	.g(HEX1[6]) 			// output  g_sig
);
binary2seven hex0
(
	.w(hex0in[3]) ,		// input  w_sig
	.x(hex0in[2]) ,		// input  x_sig
	.y(hex0in[1]) ,		// input  y_sig
	.z(hex0in[0]) ,		// input  z_sig
	.a(HEX0[0]) ,			// output  a_sig
	.b(HEX0[1]) ,			// output  b_sig
	.c(HEX0[2]) ,			// output  c_sig
	.d(HEX0[3]) ,			// output  d_sig
	.e(HEX0[4]) ,			// output  e_sig
	.f(HEX0[5]) ,			// output  f_sig
	.g(HEX0[6]) 			// output  g_sig
);	
endmodule 