ECE281_Lab2
===========

C3C Pluger's Lab2; ECE281

##Analysis
Full Adder: I determined how the Full Adder should operate by creating a truth table with A, B, and Cin as inputs and Sum and Cout as outputs. From the truth table I determined my SOP equation for each of my outputs. I then created a schematic from my SOP. I created a [test bench](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Full_Adder_testbench.vhd "test bench code") for my Full Adder and verified that the [waveform](https://github.com/JasonPluger/ECE281_Lab2/blob/master/full_adder.JPG "Full Adder Waveform") results matched my truth table, which they did. 

Four-Bit Adder: For the four-bit adder, my general plan was to "chain" four Full Adders together to achieve the desired results. Because the solution required 4 bits for each input (Ain and Bin), I used STD_LOGIC_VECTORS to make Ain and Bin each 4-bit numbers. Sum was also a 4 bit number. To translate the Carry out and Carry in were of STD_LOGIC type. Signals (named L, M, N) were used to translate the Cout from the previous bit to the Cin of the following bit. This is evidenced in the 'architecture' section of my [Four Bit Adder VHDL Code](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Four_Bit_Adder.vhd "Four Bit Adder Code"). I then created a [testbench](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Four_Bit_Adder_testbench.vhd "Four-Bit Adder testbench code") to test my four bit adder code using nested for loops to increment the value of Ain or Bin for every iteration through the loop. In doing this, the testbench was effectively able to test every possible combination of Ain and Bin and evaluate for the Sum of the two numbers in a very efficient manner. The testbench was coded to throw a "report" statement back to the user if a certain combination of Ain + Bin did NOT add to the correct value of Sum. After running my testbench, I did not get any errors. I further corroborated the correctness by testing random inputs of Ain and Bin, calculating what the Sum should be, and comparaing it to the output on the Nexys 2 board after uploading my .ucf file to it. Here is the simulated [waveform](https://github.com/JasonPluger/ECE281_Lab2/blob/master/four_bit_adder_waveform.JPG "four bit adder waveform") of my four-bit adder.

Subtractor Functionality: C3C Weisner explained to me that we have to create another signal (which I called negB) which we will program to take on the value of B when the button on the FPGA board is NOT pressed. When the button IS pressed, negB will take on the value of the two's complement of B. He also told me (but did not know why we have to do this) that we need another signal (which I called altB) that will be used to take on the value of B. Therefore, negB is actually not getting its values from B, but instead from altB which in turn is essentially a copy of B. 

Overflow detection: I attempted to implement the overflow detection functionality, but was unsuccessful. I tried to create a signal (which I called "over") that would take on the value equal to Cout(3) XOR Cin(3). Therefore, "over" would be 1 if Cout(3) and Cin(3) were different, and 0 if they were the same. However, I kept getting a warning prior to synthesis stating "Four_Bit_Adder.stx not found" and when I tried to synthesize, I would get a "Wrong index type Cout(3)/Cin(3)" error. After doing some research online, I found that the .stx file has something to do with the library responsible for performing arithmetic functions, and because I have to convert the STD_LOGIC_VECTOR Cout/Cin values to integers for the XOR function, this may have been the reason my code would not synthesize.

UCF File: After verifying that my code was syntax-error free, I created a [.ucf file](https://github.com/JasonPluger/ECE281_Lab2/blob/master/Four_Bit_Adder_Implementation.ucf "implementation file") that programmed my .vhd file onto the Nexys 2 FPGA. Ain is implemented through the first four switches on the FPGA (from right to left) while Bin is the next four switches (farthest left). Sum is displayed on the right hand LEDs with the LSB occupying the farthest right. The user is alerted of overflow occuring by the fifth light from the right lighting up.

####Waveforms
[Full Adder Waveform](https://github.com/JasonPluger/ECE281_Lab2/blob/master/full_adder.JPG "full adder")

[Four Bit Adder Waveform](https://github.com/JasonPluger/ECE281_Lab2/blob/master/four_bit_adder_waveform.JPG "four bit adder")

####Full Adder Schematic
[Schematic](https://github.com/JasonPluger/ECE281_Lab2/blob/master/schematic.jpg "Schematic")

####Full Adder Truth Table (and more)
[Table](https://github.com/JasonPluger/ECE281_Lab2/blob/master/truth_table.jpg "Truth table and more")


I successfully demonstrated the basic 4-bit adder functionality with a carry-out indicator, but not overflow indicator, to Dr. Neebel on 14Feb14 at 1420.


