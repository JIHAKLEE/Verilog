//This is for the 1-bit full adder module.

module full_adder_gatelevel_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;

	wire xor_out_1;
//	wire xnor_out_1, xnor_out_2;
//	wire not_out_1;

	wire and_out_1, and_out_2;
	wire or_out_1;

	//sum
	xor_gatelevel_gate xor_1(.a(a), .b(b), .out(xor_out_1));
	xor_gatelevel_gate xor_2(.a(xor_out_1), .b(cin), .out(sum));
	//Fill this out

	//cout
	and_gate and_1 (.a(a), .b(b), .out(and_out_1));
	or_gate or_1 (.a(a), .b(b), .out(or_out_1));
	and_gate and_2 (.a(or_out_1), .b(cin), .out(and_out_2));
	or_gate or_2 (.a(and_out_1), .b(and_out_2), .out(cout));
	//Fill this out

endmodule