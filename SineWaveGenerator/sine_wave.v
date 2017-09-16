module sine_wave(CLOCK_50, SW, SCK, DAC_CS, DAC_SDI, DAC_LD, HEX0_D, HEX1_D, HEX2_D, HEX3_D);
input CLOCK_50; 
input[9:0] SW; 
output SCK; 
output DAC_CS; 
output DAC_SDI; 
output DAC_LD; 
output[6:0] HEX0_D; 
output[6:0] HEX1_D; 
output[6:0] HEX2_D; 
output[6:0] HEX3_D; 
wire clk_div; 
wire[23:0] result; 
wire[3:0] BCD_0; 
wire[3:0] BCD_1; 
wire[3:0] BCD_2; 
wire[3:0] BCD_3; 
wire pulse; 
reg[9:0] A; 
reg[9:0] D; 
initial begin
	D = 0; 
end
clk_div c1(CLOCK_50, 2499, clk_div); 
always@(posedge clk_div)begin
	D <= A + SW; 
	A <= D; 
end
rom_data r1(A, clk_div, D); 
pulse_gen g1(CLOCK_50, pulse, clk_div);
spi2dac s1(CLOCK_50, D, pulse, DAC_SDI, DAC_CS, SCK, DAC_LD); 
mult m1(SW, result); 
wire[13: 0] t = result[23:10]; 
bin2bcd b1(t, BCD_0, BCD_1, BCD_2 BCD_3); 
hex_to_7seg h1(HEX3_D, BCD_3); 
hex_to_7seg h2(HEX2_D, BCD_2); 
hex_to_7seg h3(HEX1_D, BCD_1);
hex_to_7seg h4(HEX0_D, BCD_0); 
endmodule