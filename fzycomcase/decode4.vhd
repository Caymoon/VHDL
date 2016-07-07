----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:25 07/07/2016 
-- Design Name: 
-- Module Name:    decode4 - Behavioral 
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

entity decode4 is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           enable : in  STD_LOGIC;
           q8 : out  STD_LOGIC;--'0'表示选中
           q9 : out  STD_LOGIC;
           q11 : out  STD_LOGIC);
end decode4;

architecture Behavioral of decode4 is

begin
	process(enable, d)
	begin
		if enable = '1' then
			case d is
				when "1000" => q8 <= '0'; q9 <= '1'; q11 <= '1';
				when "1001" => q8 <= '1'; q9 <= '0'; q11 <= '1'; 
				when "1011" => q8 <= '1'; q9 <= '1'; q11 <= '0';
				when others => q8 <= '1'; q9 <= '1'; q11 <= '1';
			end case;
		else --disabled
			q8 <= '1'; q9 <= '1'; q11 <= '1';
		end if;
	end process;

end Behavioral;

