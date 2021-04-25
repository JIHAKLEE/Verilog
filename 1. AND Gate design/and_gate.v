module and_example (a, b, clk, out);
	
	input a, b;
	input clk;

	output out;
	reg out;
	
	always @ (posedge clk)
	begin
		out <= a & b;
	end

endmodule