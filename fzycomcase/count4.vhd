----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:46 07/07/2016 
-- Design Name: 
-- Module Name:    count4 - Behavioral 
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity count4 is
    Port ( clk : in  STD_LOGIC;
           clrn : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end count4;

architecture Behavioral of count4 is

begin
	process(clk, clrn)
		variable num: integer;
	begin
		if clrn = '0' then
			q <= "0000"; --³õÊ¼»¯
			num := 0;
		elsif clk = '0' and clk'event then
			num := num + 1;
			q <= conv_std_logic_vector(num, 4);
		end if;
	end process;

end Behavioral;

