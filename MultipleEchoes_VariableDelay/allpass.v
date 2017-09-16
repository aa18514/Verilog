//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Peter Cheung
// Version:  1.1
// Date:     24 Jan 2014
//------------------------------

module processor (SW, sysclk, data_in, data_out, data_valid);
	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data
	reg[12: 0] count; 
	input data_valid; 
	input[8 : 0] SW; 
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire[12 : 0] waddr; 
	wire full; 
	wire[8:0] out;  
	reg Q; 
	wire p; 
	pulse_gen p1(p, data_valid, sysclk);
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign waddr = count + {SW[8:0], 4'b0};
	RAM r1(sysclk, y[9:1], count, p, waddr, p, out);
	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	assign y = x - {out[8], out[8], out[8:1]};

	
	//  Now clock y output with system clock
	always @(posedge sysclk) begin
		data_out <=  (y + DAC_OFFSET);
	end
endmodule
	