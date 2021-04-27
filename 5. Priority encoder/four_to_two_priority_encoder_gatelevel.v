//This is for the 4:2 priority encoder module.

module four_to_two_priority_encoder_gatelevel_module (a, b, c, d, out0, out1);
	input a, b, c, d;

	output out0, out1;
	wire not_1_out, and_1_out; // we have to conect two gates with these wires.
	
	//Fill this out
	not_gate not_1(.a(c), .out(not_1_out)); // c => c'
	and_gate and_1(.a(b), .b(not_1_out), .out(and_1_out)); // c' && b => and_1_out
	or_gate or_1(.a(d), .b(and_1_out), .out(out0)); // d + (c' && b) => out0
	or_gate or_2(.a(c), .b(d), .out(out1)); // c + d => out1

endmodule
