module shift_pattern(pattern, clock); 
	output[9:0] pattern; 
	input clock; 
	reg[9:0] pattern; 
	reg count_right; 
	reg count_left; 
	initial begin
		pattern = 10'b0000110000;
	end
	always@(posedge clock) begin
		if(pattern == 10'b0000110000)begin
			count_left = 1; 
			count_right = 0;
		end
		if(pattern == 10'b1000000001)begin
			count_right = 1; 
			count_left = 0; 
		end

		if(count_left == 1)begin
		case(pattern)
			10'b0000110000:pattern=10'b0001001000; 
			10'b0001001000:pattern=10'b0010000100;
			10'b0010000100:pattern=10'b0100000010;
			10'b0100000010:pattern=10'b1000000001;
		endcase
		end
		else
		case(pattern)
			10'b1000000001:pattern=10'b0100000010; 
			10'b0100000010:pattern=10'b0010000100;
			10'b0010000100:pattern=10'b0001001000;
			10'b0001001000:pattern=10'b0000110000;
			endcase
		end
	endmodule
