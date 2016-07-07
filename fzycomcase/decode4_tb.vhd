--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:47:20 07/07/2016
-- Design Name:   
-- Module Name:   E:/VHDL/VHDL/fzycomcase/decode4_tb.vhd
-- Project Name:  fzycomcase
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decode4
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
 
ENTITY decode4_tb IS
END decode4_tb;
 
ARCHITECTURE behavior OF decode4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decode4
    PORT(
         d : IN  std_logic_vector(3 downto 0);
         enable : IN  std_logic;
         q8 : OUT  std_logic;
         q9 : OUT  std_logic;
         q11 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal q8 : std_logic;
   signal q9 : std_logic;
   signal q11 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decode4 PORT MAP (
          d => d,
          enable => enable,
          q8 => q8,
          q9 => q9,
          q11 => q11
        );

   -- Stimulus process
   stim_proc: process
   begin		
     d <= "0000";
		enable <= '0';
		wait for 10 ns;
		d <= "0001";
		wait for 10 ns;
		d <= "0010";
		wait for 10 ns;
		d <= "0011";
		wait for 10 ns;
		d <= "0100";
		wait for 10 ns;
		d <= "0101";
		wait for 10 ns;
		d <= "0110";
		wait for 10 ns;
		d <= "0111";
		wait for 10 ns;
		d <= "1000";
		wait for 10 ns;
		d <= "1001";
		wait for 10 ns;
		d <= "1010";
		wait for 10 ns;
		d <= "1011";
		wait for 10 ns;
		d <= "1100";
		wait for 10 ns;
		d <= "1101";
		wait for 10 ns;
		d <= "1110";
		wait for 10 ns;
		d <= "1111";
		wait for 10 ns;
		enable <= '1';
		d <= "0000";
		wait for 10 ns;
		d <= "0001";
		wait for 10 ns;
		d <= "0010";
		wait for 10 ns;
		d <= "0011";
		wait for 10 ns;
		d <= "0100";
		wait for 10 ns;
		d <= "0101";
		wait for 10 ns;
		d <= "0110";
		wait for 10 ns;
		d <= "0111";
		wait for 10 ns;
		d <= "1000";
		wait for 10 ns;
		d <= "1001";
		wait for 10 ns;
		d <= "1010";
		wait for 10 ns;
		d <= "1011";
		wait for 10 ns;
		d <= "1100";
		wait for 10 ns;
		d <= "1101";
		wait for 10 ns;
		d <= "1110";
		wait for 10 ns;
		d <= "1111";
		wait for 10 ns;
      wait;
   end process;

END;
