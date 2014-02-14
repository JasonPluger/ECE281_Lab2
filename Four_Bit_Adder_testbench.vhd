--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:38:39 02/11/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jason.Pluger/Documents/Classes/Spring 2014 Classes/ECE 281/ISE Projects/Lab2/Four_Bit_Adder_testbench.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Documentation: Looked at this website: http://www.ics.uci.edu/~jmoorkan/vhdlref/ifs.html to help determine syntax
-- of if statement in VHDL.
--						I looked at this website: http://www.seas.upenn.edu/~ese171/vhdl/VHDLTestbench.pdf to help me
--						determine the syntax of the loops for the 4-bit testbench
-- 
-- VHDL Test Bench Created by ISE for module: Four_Bit_Adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
	USE ieee.numeric_std.ALL;
	USE ieee.std_logic_unsigned.ALL;
 
ENTITY Four_Bit_Adder_testbench IS
END Four_Bit_Adder_testbench;
 
ARCHITECTURE behavior OF Four_Bit_Adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Four_Bit_Adder
    PORT(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic;
--
-- 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Four_Bit_Adder PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	--initialize the values of Ain and Bin
	Ain <= "0000";
	Bin <= "0000";
	Cin <= '0';
	
	--for loop
	for I in 0 to 3 loop
		for J in 0 to 3 loop
		
		wait for 10ns;
		--make an assertion, throw report if it's not right
		assert Sum = (Ain + Bin) report "Expected sum of " &
			integer'image(to_integer(unsigned((Ain + Bin)))) & "for A = " &
			integer'image(to_integer(unsigned((Ain)))) & "for B = " &
			integer'image(to_integer(unsigned((Bin)))) & ", but was " &
			integer'image(to_ingeter(unsigned((Sum)))) severity ERROR;	
		--increment B	
		Bin <= Bin + "0001";
		end loop;
	Ain <= Ain + "0001";
	end loop;
	
		report "testing completed";
		wait;
	end process;
	
--      -- hold reset state for 100 ns.
--		--Test 1: Sum:(1)0100
--		Ain(0) <= "0";
--		Ain(1) <= "1";
--		Ain(2) <= "1";
--		Ain(3) <= "0";
--		
--		Bin(0) <= "0";
--		Bin(1) <= "1";
--		Bin(2) <= "1";
--		Bin(3) <= "1";
--      wait for 100 ns;	
--		
--		--Test 2: Sum:(1)1000
--		Ain(0) <= "1";
--		Ain(1) <= "1";
--		Ain(2) <= "0";
--		Ain(3) <= "1";
--		
--		Bin(0) <= "1";
--		Bin(1) <= "0";
--		Bin(2) <= "1";
--		Bin(3) <= "1";
--      wait for 100 ns;
--		
--		--Test 3: Sum(Cout):(0)1110
--		Ain(0) <= "1";
--		Ain(1) <= "1";
--		Ain(2) <= "0";
--		Ain(3) <= "0";
--		
--		Bin(0) <= "1";
--		Bin(1) <= "1";
--		Bin(2) <= "0";
--		Bin(3) <= "1";
--      wait for 100 ns;
--		
--		--Test 4: Sum(Cout):(1)1110
--		Ain(0) <= "1";
--		Ain(1) <= "1";
--		Ain(2) <= "1";
--		Ain(3) <= "1";
--		
--		Bin(0) <= "1";
--		Bin(1) <= "1";
--		Bin(2) <= "1";
--		Bin(3) <= "1";
--      wait for 100 ns;

--      wait for <clock>_period*10;

      -- insert stimulus here 

--      wait;
--   end process;

END;
