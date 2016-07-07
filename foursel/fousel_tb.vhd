--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:20:28 07/06/2016
-- Design Name:   
-- Module Name:   E:/VHDL/foursel/fousel_tb.vhd
-- Project Name:  foursel
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: foursel
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
 
ENTITY fousel_tb IS
END fousel_tb;
 
ARCHITECTURE behavior OF fousel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT foursel
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         d : IN  std_logic;
         sel : IN  std_logic_vector(1 downto 0);
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '1';
   signal c : std_logic := '0';
   signal d : std_logic := '1';
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: foursel PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          sel => sel,
          y => y
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		sel<="00";
		wait for 100 ns;
		sel<="01";
		wait for 100 ns;
		sel<="10";
		wait for 100 ns;
		sel<="11";
		wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
