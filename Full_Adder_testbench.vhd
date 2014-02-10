--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:25:09 02/10/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jason.Pluger/Documents/Classes/Spring 2014 Classes/ECE 281/ISE Projects/Lab2/Full_Adder_testbench.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
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
--USE ieee.numeric_std.ALL;
 
ENTITY Full_Adder_testbench IS
END Full_Adder_testbench;
 
ARCHITECTURE behavior OF Full_Adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         Ain : IN  std_logic;
         Bin : IN  std_logic;
         Cin : IN  std_logic;
         Sum : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic := '0';
   signal Bin : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
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
	
		Ain <= '0';
		Bin <= '0';
		Cin <= '0';
      wait for 100 ns;

		Ain <= '0';
		Bin <= '0';
		Cin <= '1';
      wait for 100 ns;
		
		Ain <= '0';
		Bin <= '1';
		Cin <= '0';
      wait for 100 ns;
		
		Ain <= '0';
		Bin <= '1';
		Cin <= '1';
      wait for 100 ns;
		
		Ain <= '1';
		Bin <= '0';
		Cin <= '0';
      wait for 100 ns;
		
		Ain <= '1';
		Bin <= '0';
		Cin <= '1';
      wait for 100 ns;
		
		Ain <= '1';
		Bin <= '1';
		Cin <= '0';
      wait for 100 ns;
		
		Ain <= '1';
		Bin <= '1';
		Cin <= '1';
      wait for 100 ns;
	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
