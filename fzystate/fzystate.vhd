----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:19:08 07/06/2016 
-- Design Name: 
-- Module Name:    fzystate - Behavioral 
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

entity fzystate is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           read_ins : in  STD_LOGIC;
           read_data : in  STD_LOGIC;
           write_data : in  STD_LOGIC;
           oe : out  STD_LOGIC;
           we : out  STD_LOGIC);
end fzystate;

architecture Behavioral of fzystate is
	type state is(state0, state1, state2, state3);
	signal pr_state,nx_state:state;
	signal temp_oe,temp_we:std_logic;
begin
	process(reset, clk, temp_oe, temp_we, nx_state)
	begin
	if(reset='1') then
		pr_state <= state0;
	elsif(clk'event and clk='1') then
		 oe <= temp_oe;
		 we <= temp_we;
		 pr_state <= nx_state;
	end if;
	end process;

	process(read_ins, read_data, write_data, pr_state)
		begin
		case pr_state is
			when state0 =>
				temp_oe <= '0';
				temp_we <= '0';
			when state1 =>
				temp_oe <= '1';
				temp_we <= '0';
			when state2 =>
				temp_oe <= '1';
				temp_we <= '0';
			when state3 =>
				temp_oe <= '0';
				temp_we <= '1';
		end case;
		if(read_ins='1') then
			nx_state <= state1;
		elsif(read_data='1') then
			nx_state <= state2;
		elsif(write_data='1') then
			nx_state <= state3;
		else
			nx_state <= state0;
		end if;
	end process;				
end Behavioral;

