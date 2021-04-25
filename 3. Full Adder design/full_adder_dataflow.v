
//This is for the 1-bit full adder module.

module full_adder_dataflow_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	
	//sum
	assign sum = (cin^(a^b)); 
	//Fill this out

	//cout
	assign cout = ((a&&b)||(cin&&a)||(cin&&b)); 
	//Fill this out
	
endmodule