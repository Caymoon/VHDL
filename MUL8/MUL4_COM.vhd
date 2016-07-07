----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:22 07/06/2016 
-- Design Name: 
-- Module Name:    MUL4_COM - Behavioral 
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

entity MUL4_COM is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  BIT_VECTOR (1 downto 0);
           Y : out  STD_LOGIC);
end MUL4_COM;

architecture Behavioral of MUL4_COM is

begin
	Y<= I(0) when S="00" else
		 I(1) when S="01" else
		 I(2) when S="10" else
		 I(3) ;
end Behavioral;

