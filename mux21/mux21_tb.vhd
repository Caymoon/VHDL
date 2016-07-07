--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:40:00 07/06/2016
-- Design Name:   
-- Module Name:   E:/VHDL/mux21/mux21_tb.vhd
-- Project Name:  mux21
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux21
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
 
ENTITY mux21_tb IS
END mux21_tb;
 
ARCHITECTURE behavior OF mux21_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux21
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         s : IN  std_logic;
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal s : std_logic := '0';

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux21 PORT MAP (
          a => a,
          b => b,
          s => s,
          y => y
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a <='0';
		b <='1';
		s <='0';
		wait for 100 ns;
		a <='0';
		b <='1';
		s <='1';
		 wait for 100 ns;	
		a <='1';
		b <='1';
		s <='0';
		wait for 100 ns;
		a <='1';
		b <='0';
		s <='0';

      wait;
   end process;

END;
