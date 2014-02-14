ECE281_Lab2
===========

C3C Pluger's Lab2; ECE281

##Analysis
Full Adder: I determined how the Full Adder should operate by creating a truth table with A, B, and Cin as inputs and Sum and Cout as outputs. From the truth table I determined by SOP equation for each of my outputs. I then created a schematic from my SOP. I created a [test bench](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Full_Adder_testbench.vhd "test bench code") for my Full Adder and verified that the [waveform](https://github.com/JasonPluger/ECE281_Lab2/blob/master/full_adder.JPG "Full Adder Waveform") results matched my truth table, which they did. 

Four-Bit Adder: For the four-bit adder, my general plan was to "chain" four Full Adders together to achieve the desired results. Because the solution required 4 bits for each input (Ain and Bin), I used STD_LOGIC_VECTORS to make Ain and Bin each 4-bit numbers. Sum was also a 4 bit number. To translate the Carry out and Carry in throughout the addition calculation, they were each of type STD_LOGIC; signals were used to translate the Cout from the previous bit to the Cin of the following bit. This is evidenced in the 'architecture' section of my [Four Bit Adder VHDL Code](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Four_Bit_Adder.vhd "Four Bit Adder Code"). I then created a [testbench](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Four_Bit_Adder_testbench.vhd "Four-Bit Adder testbench code") to test my four bit adder code using nested for loops to increment the value of Ain or Bin for every iteration through the loop. In doing this, the testbench was effectively able to test every possible combination of Ain and Bin and evaluate for the Sum of the two numbers. The testbench was coded to throw a "report" statement if a certain combination of Ain + Bin did NOT add to the correct value of Sum. After running my testbench, I did not get any errors. I further corroborated the correctness by testing random inputs of Ain and Bin, calculating what the Sum should be, and comparaing it to the output on the Nexys 2 board after uploading my .ucf file to it.

####Full Adder Waveform
[Waveform Screencapture](https://github.com/JasonPluger/ECE281_Lab2/blob/master/full_adder.JPG "Waveform")

####Full Adder Schematic
[Schematic](https://github.com/JasonPluger/ECE281_Lab2/blob/master/schematic.jpg "Schematic")

####Full Adder Truth Table (and more)
[Table](https://github.com/JasonPluger/ECE281_Lab2/blob/master/truth_table.jpg "Truth table and more")


