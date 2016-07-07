--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:29:56 07/06/2016
-- Design Name:   
-- Module Name:   E:/VHDL/MUL8/MUL8_tb.vhd
-- Project Name:  MUL8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUL8
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUL8_tb IS
END MUL8_tb;
 
ARCHITECTURE behavior OF MUL8_tb IS 
    COMPONENT MUL8
    PORT(
         I: in STD_LOGIC_VECTOR (0 to 7);
          S: in BIT_VECTOR (2 downto 0);
          Y: out STD_LOGIC
        );
    END COMPONENT;
   --Inputs
   signal I : std_logic_vector(0 to 7) := (others => '0');
   signal S :  BIT_VECTOR(2 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
BEGIN
 -- Instantiate the Unit Under Test (UUT)
   uut: MUL8 PORT MAP (
          I => I,
          S => S,
          Y => Y
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
      I <="00000001";
		S <= "000";		
		wait for 100 ns;
      I <="00000001";
		S <= "001";	
		wait for 100 ns;
      I <="00000101";
		S <= "010";			
		wait for 100 ns;
      I <="00000001";
		S <= "011";		
		wait for 100 ns;
      I <="00010001";
		S <= "100";		
		wait for 100 ns;
      I <="00000001";
		S <= "101";	
		
		wait for 100 ns;
      I <="01000001";
		S <= "110";	
      -- insert stimulus here 
      wait;
   end process;

END;
