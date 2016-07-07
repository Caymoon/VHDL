--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:01 07/07/2016
-- Design Name:   
-- Module Name:   E:/VHDL/fzystate0/tb.vhd
-- Project Name:  fzystate0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fzystate0
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
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fzystate0
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         d : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         x : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal d : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal x : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fzystate0 PORT MAP (
          a => a,
          b => b,
          d => d,
          clk => clk,
          rst => rst,
          x => x
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period;
		rst<='0';
		a<='0';
		b<='1';
		d<='0';
		
		wait for clk_period;
		rst<='0';
		a<='0';
		b<='1';
		d<='1';
		
		wait for clk_period;
		rst<='0';
		a<='1';
		b<='1';
		d<='0';
		
		wait for 100 ns;
		rst<='0';
		a<='1';
		b<='0';
		d<='0';
		
      wait;
   end process;

END;
