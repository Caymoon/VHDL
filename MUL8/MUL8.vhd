----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:28:33 07/06/2016 
-- Design Name: 
-- Module Name:    MUL8 - Behavioral 
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

entity MUL8 is
        port (
          I: in STD_LOGIC_VECTOR (0 to 7);
          S: in BIT_VECTOR (2 downto 0);
          Y: out STD_LOGIC
         );

end MUL8;

architecture Behavioral of MUL8 is
component MUL4_COM 
    port (
          I: in std_logic_vector (0 to 3);
          S: in BIT_VECTOR (1 downto 0);
          Y: out std_logic 
         );
end component;

component MUL2_COM    
    port (
          I: in std_logic_vector (0 to 1);
          S: in BIT;
          Y: out std_logic
         );
end component;
signal Y1,Y2 : std_logic;

begin
element1: MUL4_COM port map (
                   I(0) => I(0),
                   I(1) => I(1),
                   I(2) => I(2),
                   I(3) => I(3),
                   S    => S(1 downto 0),
                   Y    => Y1);

element2: MUL4_COM port map (
                   I(0) => I(4),
                   I(1) => I(5),
                   I(2) => I(6),
                   I(3) => I(7),
                   S    => S(1 downto 0),
                   Y    => Y2);

element3: MUL2_COM port map (
                   I(0) => Y1,
                   I(1) => Y2,
                   S    => S(2),
                   Y    => Y);

end Behavioral;

