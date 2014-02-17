----------------------------------------------------------------------------------
-- Company: USAF Academy ECE 281
-- Engineer: Jason G. Pluger
-- 
-- Create Date:    13:54:56 02/10/2014 
-- Design Name: 
-- Module Name:    Four_Bit_Adder - Behavioral 
-- Project Name: 
-- Target Devices: Nexsys 2 FPGA
-- Tool versions: 
-- Description: This vhdl code programs an FPGA to do 4-bit addition of
-- two four bit numbers.
-- Documentation: 	Looked at this website: http://www.ics.uci.edu/~jmoorkan/vhdlref/ifs.html to help determine syntax
-- 					of if statement in VHDL.
--							I looked at this website: http://www.seas.upenn.edu/~ese171/vhdl/VHDLTestbench.pdf to help me
--						determine the syntax of the loops for the 4-bit testbench
--							13Feb14 - C3C Bolinger helped me fix errors in my code by helping me determine that the
-- 					Bit0 Cin should be assigned to Cin when doing port maps, as well as the Bit3
--						Cout should be assigned to Cout to get the program to compile and synthesize correctly.
-- 						14Feb14 - C3C Weisner explained how to do the subtractor by adding a 
--							17Feb14 - While attempting to figure out how to implement the overflow detection, I kept
--						getting a "Wrong index type for Cout/Cin" error. So I went to this site: http://www.velocityreviews.com/forums/t24096-wrong-index-type.html
--						which told me that I need to enable the ieee.numeric_std.all library an convert the Cout(3)/Cin(3) STD_LOGIC_VECTOR	
--						values to unsigned integers in order for it to work.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Four_Bit_Adder is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in STD_LOGIC;
--           Cin : in  STD_LOGIC_VECTOR (3 downto 0);
--           Cout : out  STD_LOGIC_VECTOR (3 downto 0);
			  neg : in STD_LOGIC;
			  Cout : out STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0));
end Four_Bit_Adder;

architecture Structural of Four_Bit_Adder is

--These are the components that we will use in this .vhd file
signal L, M, N, over : STD_LOGIC;
signal altB, negB : STD_LOGIC_VECTOR (3 downto 0);

 --Create a component that is the full adder we created in the pre-lab.
	component Full_Adder is
		port( Ain : in STD_LOGIC;
				Bin : in STD_LOGIC;
				Cin : in STD_LOGIC;
				Cout: out STD_LOGIC;
				Sum : out STD_LOGIC);
		end component Full_Adder;

begin
   
altB <= Bin;
negB <= altB when neg = '0' else
	STD_LOGIC_VECTOR(signed(not altB)+1) when neg = '1';
	
over <= to_integer(unsigned(Cout(3))) xor to_integer(unsigned(Cin(3)));
	 
  --instantiate a full_adder for each bit of our 4-bit vector
Bit0: Full_Adder
		port map (Ain => Ain(0),
					 Bin => negB(0), --instead of Bin(0)
--					 Bin => Bin(0),
					 Cin => Cin,
					 Cout => L,
--					 Cout => Cout(0),
					 Sum => Sum(0));

Bit1: Full_Adder
		port map (Ain => Ain(1),
--					 Bin => Bin(1),
					 Bin => negB(1),
--					 Cin => Cout(0),--the Cout of the first bit is the same as the Cin of the second
					 Cin => L,
--					 Cout => Cout(1),
					 Cout => M,
					 Sum => Sum(1));
					 
Bit2: Full_Adder
		port map (Ain => Ain(2),
--					 Bin => Bin(2),
					 Bin => negB(2),
--					 Cin => Cout(1),
					 Cin => M,
--					 Cout => Cout(2),
					 Cout => N,
					 Sum => Sum(2));
					 
Bit3: Full_Adder
		port map (Ain => Ain(3),
--					 Bin => Bin(3),
					 Bin => negB(3),
--					 Cin => Cout(2),
					 Cin => N,
--					 Cout => Cout(3),
					 Cout => Cout,
					 Sum => Sum(3));


end Structural;

