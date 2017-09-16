     
 module load(SW, HEX0_D, HEX1_D, HEX2_D, CLOCK_50);
input CLOCK_50; 
output[6:0] HEX2_D;
output[6:0] HEX1_D;
output[6:0] HEX0_D;
wire[11:0] DATA;
input[9:0] SW; 
ROM r1(SW, CLOCK_50, DATA);
hex_to_7seg h1(HEX2_D, DATA[11:8]);
hex_to_7seg h2(HEX1_D, DATA[7: 4]);
hex_to_7seg h3(HEX0_D, DATA[3: 0]);
endmodule