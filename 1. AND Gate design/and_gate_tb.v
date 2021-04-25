`include "and_gate.v"

module and_gate_tb;
	reg A, B, CLK;
	wire OUT;
	
	and_example Inst_example ( .a(A), .b(B), .clk(CLK), .out(OUT));

	initial
	begin
		
		forever
		begin
			#5 CLK = ~CLK;
		end
	end
	
	initial 
	begin
                 CLK = 1'b1;
		 #10 A = 0; B = 0;
		 #10 A = 0; B = 1;
		 #10 A = 1; B = 0;
		 #10 A = 1; B = 1;
	end
	
	
endmodule