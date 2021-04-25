`include "or_gate.v"
`include "not_gate.v"
`include "and_gate.v"


module xor_gatelevel_gate (a, b, out); 
	
	input a, b;

	output out;

	wire not_a_out, not_b_out;
	wire and_1_out, and_2_out;

	not_gate not_a (.a(a), .out(not_a_out));
	not_gate not_b (.a(b), .out(not_b_out));
	and_gate and_1 (.a(not_a_out), .b(b), .out(and_1_out));
	and_gate and_2 (.a(not_b_out), .b(a), .out(and_2_out));
	or_gate or_1 (.a(and_1_out), .b(and_2_out), .out(out));

//Fill this out
endmodule