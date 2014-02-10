----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:07:36 02/10/2014 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( Ain : in  STD_LOGIC;
           Bin : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

  signal Ain_not, Bin_not, Cin_not, D, E, F, G, H, I, J: STD_LOGIC;

begin
Ain_not <= not Ain;
Bin_not <= not Bin;
Cin_not <= not Cin;

 --AND signals for Sum
D <= Ain_not and Bin_not and Cin;
E <= Ain_not and Bin and Cin_not;
F <= Ain and Bin_not and Cin_not;
G <= Ain and Bin and Cin;
 --AND signals for Cout
H <= Ain_not and Bin and Cin;
I <= Ain and Bin_not and Cin;
J <= Ain and Bin;

Sum <= D or E or F or G;
Cout <= H or I or J;

end Behavioral;

