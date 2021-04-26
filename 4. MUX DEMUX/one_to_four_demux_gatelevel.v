//This is for the 1:4 demux module.

module one_to_four_demux_gatelevel_module (a, s0, s1, out1, out2, out3, out4);
	input a;
	input s0, s1;	
	output out1, out2, out3, out4;

	wire not_1_output, not_2_output;
	wire and_1_output, and_3_output, and_5_output, and_7_output;

	//Fill this out.
	not_gate not_1(.a(s0), .out(not_1_output));
	not_gate not_2(.a(s1), .out(not_2_output));

	and_gate and_1(.a(not_1_output), .b(not_2_output), .out(and_1_output));
	and_gate and_2(.a(and_1_output), .b(a), .out(out1));

	and_gate and_3(.a(s0), .b(not_2_output), .out(and_3_output));
	and_gate and_4(.a(and_3_output), .b(a), .out(out2));

	and_gate and_5(.a(not_1_output), .b(s1), .out(and_5_output));
	and_gate and_6(.a(and_5_output), .b(a), .out(out3));

	and_gate and_7(.a(s0), .b(s1), .out(and_7_output));
	and_gate and_8(.a(and_7_output), .b(a), .out(out4));
	
endmodule
