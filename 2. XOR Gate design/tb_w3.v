module tb_w3;
	reg A, B;
	
	//This is for the example of nor gare implementations.
	wire OUT_NOR_D, OUT_NOR_G, OUT_NOR_B;
	
	//Use the following wires for your homework.
	//Each one is for the output ports for your modules 
	//with dataflow modeling, gate-level modeling, 
	//and behavioral modeling, respectively.
	wire OUT_XOR_D, OUT_XOR_G, OUT_XOR_B;
	
	
	nor_dataflow_gate nor_dataflow_module(.a(A), .b(B), .out(OUT_NOR_D)); 
	nor_gatelevel_gate nor_gatelevel_module(.a(A), .b(B), .out(OUT_NOR_G)); 
	nor_behavioral_gate nor_behavioral_module(.a(A), .b(B), .out(OUT_NOR_B));
	
	
	xor_dataflow_gate xor_dataflow_module(.a(A), .b(B), .out(OUT_XOR_D));
	xor_gatelevel_gate xor_gatelevel_module(.a(A), .b(B), .out(OUT_XOR_G)); 
	xor_behavioral_gate xor_behavioral_module(.a(A), .b(B), .out(OUT_XOR_B));
	//Fill this out (Instantiation of your modules)

	initial 
	begin
		A = 0; B = 0;		 
		#10 A = 0; B = 0;
		#10 A = 0; B = 1;
		#10 A = 1; B = 0;
		#10 A = 1; B = 1;
	end
	
	
endmodule