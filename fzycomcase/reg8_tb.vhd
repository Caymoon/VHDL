--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:58:03 07/07/2016
-- Design Name:   
-- Module Name:   E:/VHDL/VHDL/fzycomcase/reg8_tb.vhd
-- Project Name:  fzycomcase
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg8
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
 
ENTITY reg8_tb IS
END reg8_tb;
 
ARCHITECTURE behavior OF reg8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg8
    PORT(
         clrn : IN  std_logic;
         clk : IN  std_logic;
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clrn : std_logic := '0';
   signal clk : std_logic := '0';
   signal d : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg8 PORT MAP (
          clrn => clrn,
          clk => clk,
          d => d,
          q => q
        );

   -- Clock process definitions
 
   -- Stimulus process
   stim_proc: process
   begin		
		clrn <= '0';
		clk <= '0';
		d <= "10111010";
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		d <= "01011111";
		clrn <= '1';
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clrn <= '0';
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
      wait;
   end process;

END;
