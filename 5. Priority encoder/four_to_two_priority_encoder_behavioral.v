//This is for the 4:2 priority encoder module.

module four_to_two_priority_encoder_behavioral_module (input_b_4bit, out0, out1);

	input [3:0] input_b_4bit; // input [3 2 1 0]
	output out0, out1; // output of this module.
	reg out0, out1; // Non blocking 
	reg [1:0] out_2bit; // out [1 0] this line needs to use casex syntax
	assign out0 = out_2bit[0]; // LSB of output
	assign out1 = out_2bit[1]; // MSB of output

	always@(input_b_4bit) 
	begin
		casex(input_b_4bit) 
		4'b0001:out_2bit=2'b00; // case1, if input_b_4bit = 0001 => out_2bit = 00
		4'b001x:out_2bit=2'b01; // case2, if input_b_4bit = 001x => out_2bit = 01
		4'b01xx:out_2bit=2'b10; // case3, if input_b_4bit = 01xx => out_2bit = 10
		4'b1xxx:out_2bit=2'b11; // case4, if input_b_4bit = 1xxx => out_2bit = 11
		default:out_2bit=2'b00;
		endcase
	
	end
	//Fill this out.

endmodule
