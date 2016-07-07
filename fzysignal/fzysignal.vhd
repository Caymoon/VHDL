----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:00 07/06/2016 
-- Design Name: 
-- Module Name:    fzysignal - Behavioral 
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

entity fzysignal is
    Port ( clk : in  STD_LOGIC;
            d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end fzysignal;

architecture Behavioral of fzysignal is
begin
	process(clk) 
	variable a,b:STD_LOGIC;
	begin
	if clk'event and clk='1' then
		a := d;
		b := a;
		q <= b;
	end if;
	end process;
end Behavioral;

