module Seven_Segment (
	input w,x,y,z,
	output reg a,b,c,d,e,f,g,a1,b1,c1,d1,e1,f1,g1);
	always @ (w,x,y,z) begin
		case({w,x,y,z})
			4'b0000:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111110000001;
			4'b0001:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111111001111;
			4'b0010:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111110010010;
			4'b0011:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111110000110;
			4'b0100:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111111001100;
			4'b0101:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111110100100;
			4'b0110:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111110100000;
			4'b0111:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111110001111;
			4'b1000:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111100000000;
			4'b1111:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111101001111;
			4'b1110:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111100010010;
			4'b1101:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111100000110;
			4'b1100:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111101001100;
			4'b1011:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111100100100;
			4'b1010:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111100100000;
			4'b1001:{a1,b1,c1,d1,e1,f1,g1,a,b,c,d,e,f,g}=14'b11111100001111;
		endcase
	end
endmodule
