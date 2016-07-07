----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:07:51 07/06/2016 
-- Design Name: 
-- Module Name:    fzyserial4 - Behavioral 
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

entity fzyserial4 is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           B : out  STD_LOGIC);
end fzyserial4;

architecture Behavioral of fzyserial4 is
 component DQ
	 port(
	 d:in std_logic;
	 clk:in std_logic;
	 q:out std_logic
	 );
 end component;
 
 signal point:std_logic_vector(0 to 4);
begin	
struct:for i in 0 to 3 generate
		dqs:DQ port map(point(i), clk, point(i+1));
	end generate;
	point(0) <= A;
	B <=point(4);
end Behavioral;

