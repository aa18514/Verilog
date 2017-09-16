module processor (sysclk, data_in, data_out, data_valid);
	input sysclk;			//system clock
	input[9:0] data_in; 	//10-bit input data
	output[9:0] data_out; 	//10-bit output data
	input data_valid;
	wire sysclk;
	wire[9:0] data_in;
	reg[9:0] data_out;
	wire[9:0] x,y;
	wire full;
	wire[9:0] out;
	reg Q;
	wire rdreq;
	wire p; 
	pulse_gen p1(p, data_valid, sysclk);
	parameter ADC_OFFSET = 10'h181;
	parameter DAC_OFFSET = 10'h200;
	assign x = data_in[9:0] - ADC_OFFSET; //x is input in 2's complement
	assign y = x - {out[9], out[9], out[9:2]};
	fifo f1(sysclk, y, rdreq, p, full, out); 
	always @ (posedge sysclk) begin
		if(full == 1) begin
			Q <= 1;
		end
	end
	assign rdreq = p & Q; 
	always @(posedge sysclk) begin
		data_out <= (y + DAC_OFFSET);
	end
endmodule