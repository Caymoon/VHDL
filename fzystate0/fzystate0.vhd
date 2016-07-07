----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:46 07/07/2016 
-- Design Name: 
-- Module Name:    fzystate0 - Behavioral 
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

entity fzystate0 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           x : out  STD_LOGIC);
end fzystate0;

architecture Behavioral of fzystate0 is
	type state is (stateA, stateB);
	signal pr_state, nx_state: state;
	signal temp: std_logic;
begin
process (rst, clk)
	begin
	   if (rst = '1') then
		pr_state <= stateA;
	   elsif (clk'event and clk = '1') then
		x <= temp;
		pr_state <= nx_state;
	   end if;
	end process;
	process (a, b, d, pr_state)
	begin
	case pr_state is
		when stateA =>
			temp <= a;
			if (d = '1') then nx_state <= stateB;
			else nx_state <= stateA;
			end if;
		when stateB =>
			temp <= b;
			if (d = '1') then nx_state <= stateA;
			else nx_state <= stateB;
			end if;
		end case;
	end process;
end Behavioral;

