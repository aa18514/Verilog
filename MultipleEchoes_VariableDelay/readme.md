# Short Description
</br>
In order to implement a echo synthesizer with variable delay we use a dual port RAM. <br />
Sice we are accessing the memory addresses sequentially so the delay is directly propotional <br />
to the affect between read and write address. This effect is controlled by the switches on the <br />
FPGA board. <br />

A 13-bit counter is used to generate the read address to the RAM. <br />
Since Each address is 13 bits wide, the 9-bit delay is represented by SW[8:0] <br />
is zero-padded in its last 4-bits. <br />

The write address is the sum of the 13 bit count value and {SW[8:0], 0, 0, 0, 0}. <br />
The delay between read and write samples is SW[8:0] x 16 x 0.1ms. <br /> 

In order to attenuate the signal by a factor of 0.5, we extract the top 9 bits and sign extend <br />
 (the processing module is bipolar, signed representation of numbers). <br /> 

data is written to and read from the RAM syncrhonously i.e whenever the "enable" pulse (driven by <br />
the pulse generator) is high. <br />
