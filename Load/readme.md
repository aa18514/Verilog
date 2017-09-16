# Short description 

The 10-switches are the inputs to the ROM. </br>
The system clock at 50 MHz is another input to ROM. </br>
10 bits -> 1024 possible addresses. </br>
The ROM reads the address specified by the switches at every 20 ns and display the data on the 7-segment display. </br>
The result is a 12 bit number, the top 4 bits are mapped as inputs to HEX2_D, followed by 4 bits mapped to HEX1_D, followed by 4 bits mapped to HEX0_D
