`timescale 1ns/1ns

module tb_w6;
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//4:2 Encoder
	//input 
	reg A_4_TO_2, B_4_TO_2, C_4_TO_2, D_4_TO_2;
	
	//output
	wire OUTPUT1_4_TO_2_B, OUTPUT0_4_TO_2_B; //behavioral modeling
	wire OUTPUT1_4_TO_2_D, OUTPUT0_4_TO_2_D; //dataflow modeling
	wire OUTPUT1_4_TO_2_G, OUTPUT0_4_TO_2_G; //gatelevel modeling	
	
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//2:4 Decoder
	//input 
	reg A_2_TO_4, B_2_TO_4;
	
	//output
	wire OUTPUT3_2_TO_4_B, OUTPUT2_2_TO_4_B, OUTPUT1_2_TO_4_B, OUTPUT0_2_TO_4_B; //behavioral modeling
	wire OUTPUT3_2_TO_4_D, OUTPUT2_2_TO_4_D, OUTPUT1_2_TO_4_D, OUTPUT0_2_TO_4_D; //dataflow modeling
	wire OUTPUT3_2_TO_4_G, OUTPUT2_2_TO_4_G, OUTPUT1_2_TO_4_G, OUTPUT0_2_TO_4_G; //gatelevel modeling

	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//4:2 Priority Encoder
	//input 
	//Fill this out
	reg [3:0] INPUT_4BIT; // INPUT of this test bench
	
	//output
	//Fill this out
	wire OUT0_B, OUT1_B; // output wire of behavioral modeling
 	wire OUT0_D, OUT1_D; // output wire of dataflow modeling
	wire OUT0_G, OUT1_G; // output wire of gatelevel modeling
	
	//temporal variable for loop
	//You may use it to create your test plan for the 4:2 priority module
	integer count;

	//Module instantiation
	//4:2 Encoder
	four_to_two_encoder_behavioral_module four_to_two_encoder_behavioral( .a(A_4_TO_2), .b(B_4_TO_2), .c(C_4_TO_2), .d(D_4_TO_2), .out0(OUTPUT0_4_TO_2_B), .out1(OUTPUT1_4_TO_2_B));	
	four_to_two_encoder_dataflow_module four_to_two_encoder_dataflow( .a(A_4_TO_2), .b(B_4_TO_2), .c(C_4_TO_2), .d(D_4_TO_2), .out0(OUTPUT0_4_TO_2_D), .out1(OUTPUT1_4_TO_2_D));
	four_to_two_encoder_gatelevel_module four_to_two_encoder_gatelevel( .a(A_4_TO_2), .b(B_4_TO_2), .c(C_4_TO_2), .d(D_4_TO_2), .out0(OUTPUT0_4_TO_2_G), .out1(OUTPUT1_4_TO_2_G));
	
	
	//2:4 Decoder
	two_to_four_decoder_behavioral_module two_to_four_decoder_behavioral(.a(A_2_TO_4), .b(B_2_TO_4), .out0(OUTPUT0_2_TO_4_B), .out1(OUTPUT1_2_TO_4_B), .out2(OUTPUT2_2_TO_4_B), .out3(OUTPUT3_2_TO_4_B));
	two_to_four_decoder_dataflow_module two_to_four_decoder_dataflow(.a(A_2_TO_4), .b(B_2_TO_4), .out0(OUTPUT0_2_TO_4_D), .out1(OUTPUT1_2_TO_4_D), .out2(OUTPUT2_2_TO_4_D), .out3(OUTPUT3_2_TO_4_D));
	two_to_four_decoder_gatelevel_module two_to_four_decoder_gatelevel(.a(A_2_TO_4), .b(B_2_TO_4), .out0(OUTPUT0_2_TO_4_G), .out1(OUTPUT1_2_TO_4_G), .out2(OUTPUT2_2_TO_4_G), .out3(OUTPUT3_2_TO_4_G));
	
	//4:2 Priority encoder
	//Fill this out
	four_to_two_priority_encoder_behavioral_module four_to_two_prority_encoder_behavioral(.input_b_4bit(INPUT_4BIT), .out0(OUT0_B), .out1(OUT1_B));
	four_to_two_priority_encoder_dataflow_module four_to_two_prority_encoder_dataflow(.a(INPUT_4BIT[0]), .b(INPUT_4BIT[1]), .c(INPUT_4BIT[2]), .d(INPUT_4BIT[3]), .out0(OUT0_D), .out1(OUT1_D));
	four_to_two_priority_encoder_gatelevel_module four_to_two_prority_encoder_gatelevel(.a(INPUT_4BIT[0]), .b(INPUT_4BIT[1]), .c(INPUT_4BIT[2]), .d(INPUT_4BIT[3]), .out0(OUT0_G), .out1(OUT1_G));
	
	initial
	begin
		 A_4_TO_2 = 1'b0; B_4_TO_2 = 1'b0; C_4_TO_2 = 1'b0; D_4_TO_2 = 1'b0;
		 A_2_TO_4 = 1'b0; B_2_TO_4 = 1'b0;
		 //Fill this out
		 INPUT_4BIT = 4'b0000;// Initializing of the input bits [0000]
	end
	
	initial 
	begin	
		 
		 // Test pattern for 4:2 Encoder
		#10 A_4_TO_2 = 1'b0; B_4_TO_2 = 1'b0; C_4_TO_2 = 1'b0; D_4_TO_2 = 1'b1;	 
		#10 A_4_TO_2 = 1'b0; B_4_TO_2 = 1'b0; C_4_TO_2 = 1'b1; D_4_TO_2 = 1'b0;	
		#10 A_4_TO_2 = 1'b0; B_4_TO_2 = 1'b1; C_4_TO_2 = 1'b0; D_4_TO_2 = 1'b0;	
		#10 A_4_TO_2 = 1'b1; B_4_TO_2 = 1'b0; C_4_TO_2 = 1'b0; D_4_TO_2 = 1'b0;	
		
		#90 //delay to border the test of 2:4 Decoder
		#10 A_2_TO_4 = 1'b0; B_2_TO_4 = 1'b0;
		#10 A_2_TO_4 = 1'b0; B_2_TO_4 = 1'b1;
		#10 A_2_TO_4 = 1'b1; B_2_TO_4 = 1'b0;
		#10 A_2_TO_4 = 1'b1; B_2_TO_4 = 1'b1;
	
		#90 //delay to border the test of 4:2 Priority encoder		//Fill this out

/////////////////THE FIRST WAY OF TEST PATTERN//////////////////////////////////////////////////////////////////////////
		for (count=0; count<16 ; count=count+1)
			#10 INPUT_4BIT = count;

/////////////////THE SECOND WAY OF TEST PATTERN//////////////////////////////////////////////////////////

//		#10 INPUT_4BIT = 4'b0000;
//		#10 INPUT_4BIT = 4'b0001;
//		#10 INPUT_4BIT = 4'b0010;
//		#10 INPUT_4BIT = 4'b0011;
//		#10 INPUT_4BIT = 4'b0100;
//		#10 INPUT_4BIT = 4'b0101;
//		#10 INPUT_4BIT = 4'b0110;
//		#10 INPUT_4BIT = 4'b0111;
//		#10 INPUT_4BIT = 4'b1000;
//		#10 INPUT_4BIT = 4'b1001;
//		#10 INPUT_4BIT = 4'b1010;
//		#10 INPUT_4BIT = 4'b1011;
//		#10 INPUT_4BIT = 4'b1100;
//		#10 INPUT_4BIT = 4'b1101;
		
	end
	
	
endmodule


