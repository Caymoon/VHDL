----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:03 07/07/2016 
-- Design Name: 
-- Module Name:    sreg - Behavioral 
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

entity sreg is
    Port ( clk : in  STD_LOGIC;
           clrn : in  STD_LOGIC;
           serial : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end sreg;

architecture Behavioral of sreg is
	signal t: std_logic_vector(7 downto 0);
begin
	process(clk, clrn)
	begin
		if (clrn = '0') then
			t <= "00000000";
		elsif (clk = '1' and clk'event) then
			t(0) <= serial;
			t(7 downto 1) <= t(6 downto 0);
		end if;
	end process;
	q <= t;

	
end Behavioral;

