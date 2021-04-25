`timescale 1ns/1ns

module tb_w4;
	reg A, B;

	//input for full adders
	reg IN_FA_CIN;
 
	//output for half adders
	wire OUT_HA_D_SUM, OUT_HA_D_CARRY; //dataflow modeling
	wire OUT_HA_B_SUM, OUT_HA_B_CARRY; //behavioral modeling
	wire OUT_HA_G_SUM, OUT_HA_G_CARRY; //gate-level modeling

	//wires for full adders
	wire OUT_FA_B_SUM, OUT_FA_B_COUT; //behavioral modeling
	wire OUT_FA_D_SUM, OUT_FA_D_COUT; //dataflow modeling
	wire OUT_FA_G_SUM, OUT_FA_G_COUT; //gate-level modeling

	//input for four bit full adder
	reg [3:0] A_4BIT, B_4BIT; // this line is input of the 4_bit full adder
	reg ZERO; // 4-bit first carry in is always 0
	
	//output for four bit full adder
	wire [3:0] OUT_FA_SUM; // this line is sum of the A_4Bit and B_4Bit
	wire OUT_FA_COUT; //the outcome is 1 when overflow occures
	
	
	half_adder_dataflow_module half_adder_dataflow(.a(A), .b(B), .sum(OUT_HA_D_SUM), .carry(OUT_HA_D_CARRY));
	half_adder_behavioral_module half_adder_behavioral(.a(A), .b(B), .sum(OUT_HA_B_SUM), .carry(OUT_HA_B_CARRY));
	half_adder_gatelevel_module half_adder_gatelevel(.a(A), .b(B), .sum(OUT_HA_G_SUM), .carry(OUT_HA_G_CARRY));

	full_adder_behavioral_module full_adder_behavioral(.a(A), .b(B), .cin(IN_FA_CIN), .sum(OUT_FA_B_SUM), .cout(OUT_FA_B_COUT));
	full_adder_dataflow_module full_adder_dataflow(.a(A), .b(B), .cin(IN_FA_CIN), .sum(OUT_FA_D_SUM), .cout(OUT_FA_D_COUT));
	full_adder_gatelevel_module full_adder_gatelevel(.a(A), .b(B), .cin(IN_FA_CIN), .sum(OUT_FA_G_SUM), .cout(OUT_FA_G_COUT));

	four_bit_full_adder_module four_bit_full_adder (.a(A_4BIT), .b(B_4BIT), .cin(ZERO), .sum(OUT_FA_SUM), .cout(OUT_FA_COUT));

 	initial 
	begin
		 A = 1'b0; B = 1'b0; IN_FA_CIN = 1'b0; ZERO = 1'b0; 
		 #10 A = 1'b0; B = 1'b0; IN_FA_CIN = 1'b1; 
		 #10 A = 1'b0; B = 1'b1; IN_FA_CIN = 1'b0; 
	         #10 A = 1'b0; B = 1'b1; IN_FA_CIN = 1'b1;		
		 #10 A = 1'b1; B = 1'b0; IN_FA_CIN = 1'b0;
		 #10 A = 1'b1; B = 1'b0; IN_FA_CIN = 1'b1;
		 #10 A = 1'b1; B = 1'b1; IN_FA_CIN = 1'b0;
	         #10 A = 1'b1; B = 1'b1; IN_FA_CIN = 1'b1;
	end
	initial 
	begin
		 A_4BIT = 4'b0000; B_4BIT = 4'b0000; // 4 Bit full adder test plan that makes outcomes generalized
		 #10 A_4BIT = 4'b1000; B_4BIT = 4'b1000; 
		 #10 A_4BIT = 4'b0000; B_4BIT = 4'b0001;
	         #10 A_4BIT = 4'b0001; B_4BIT = 4'b0000;
		 #10 A_4BIT = 4'b0001; B_4BIT = 4'b0001; 
		 #10 A_4BIT = 4'b1111; B_4BIT = 4'b0010;  
	end
endmodule