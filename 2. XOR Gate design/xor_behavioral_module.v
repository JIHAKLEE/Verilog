module xor_behavioral_gate (a, b, out); 
	
	input a, b;

	output out;
	reg out;
	
	always @ (a or b)
	begin //Fill this out (Instantiation of your modules)
		if((a == 1'b0 && b == 1'b1) || (a == 1'b1 && b == 1'b0))
		begin
			out <= 1'b1;
		end
		else
		begin
			out <= 1'b0;
		end
	end

endmodule