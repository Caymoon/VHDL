--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:13:50 07/08/2016
-- Design Name:   
-- Module Name:   E:/VHDL/VHDL/fzycomcase/fzyserial_tb.vhd
-- Project Name:  fzycomcase
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fzycomcase
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
 
ENTITY fzyserial_tb IS
END fzyserial_tb;
 
ARCHITECTURE behavior OF fzyserial_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fzycomcase
    PORT(
         serialdata : IN  std_logic;
         clk : IN  std_logic;
         csn : IN  std_logic;
         wrn : IN  std_logic;
         rdn : IN  std_logic;
         addr : IN  std_logic_vector(1 downto 0);
         data : INOUT  std_logic_vector(7 downto 0);
         intn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal serialdata : std_logic := '0';
   signal clk : std_logic := '0';
   signal csn : std_logic := '0';
   signal wrn : std_logic := '0';
   signal rdn : std_logic := '0';
   signal addr : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal intn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fzycomcase PORT MAP (
          serialdata => serialdata,
          clk => clk,
          csn => csn,
          wrn => wrn,
          rdn => rdn,
          addr => addr,
          data => data,
          intn => intn
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
		rdn <= '1';--初始化机器数据
      csn <= '0';	
		wrn <= '0';
		addr <= "00";
		wait for clk_period;
		addr <= "01";
		wait for clk_period;
		addr <= "10";
		wait for clk_period;
		addr <= "11";
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		
		
		--case 1: 成功传输数据
		serialdata <= '0'; --bit 0:开始	
		--sq0 <= '0';
		wait for clk_period;
		serialdata <= '1'; --bit 1
		--sq1 <= '0';
		--sq0 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 2
		--sq1 <= '1';
		--sq0 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 3
		wait for clk_period;
		serialdata <= '1'; --bit 4
		wait for clk_period;
		serialdata <= '1'; --bit 5
		wait for clk_period;
		serialdata <= '1'; --bit 6
		wait for clk_period;
		serialdata <= '1'; --bit 7
		wait for clk_period;
		serialdata <= '1'; --bit 8
		--rq <= "11111111"; --latched
		wait for clk_period;
		serialdata <= '0'; --bit 9: 偶校验
		--sq0 <= '0';
		--d9 <= '0';
		wait for clk_period;
		serialdata <= '1'; --bit 10
		--sq1 <= '0';
		--sq0 <= '1';
		--d9 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 11: 结束
		--sq1 <= '1';
		--sq0 <= '1';
		--d11 <= '0';
		wait for clk_period;
		--d11 <= '1'; --should output buff = '1', intn = '0'
		wait for clk_period; --绛夊緟涓�涓椂閽熷懆鏈燂紝琛ㄧずCPU涓嶄細绔嬪嵆鍝嶅簲涓柇
		csn <= '0'; --CPU check int flag
		rdn <= '0';
		addr <= "01"; --should output data(2 downto 0) = "001"
		wait for clk_period;
		addr <= "00"; --CPU read buffer, should output data = "11111111"
		wait for clk_period;
		rdn <= '1';
		wrn <= '0';
		addr <= "01"; --clear int buffer
		wait for clk_period;
		addr <= "00"; --reset (clrn <= '0')
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		wait for clk_period;
      
		--case 2: odd/even verify error
		serialdata <= '0'; --bit 0: start bit
		--sq0 <= '0';
		wait for clk_period;
		serialdata <= '1'; --bit 1
		--sq1 <= '0';
		--sq0 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 2
		--sq1 <= '1';
		--sq0 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 3
		wait for clk_period;
		serialdata <= '1'; --bit 4
		wait for clk_period;
		serialdata <= '1'; --bit 5
		wait for clk_period;
		serialdata <= '1'; --bit 6
		wait for clk_period;
		serialdata <= '1'; --bit 7
		wait for clk_period;
		serialdata <= '1'; --bit 8
		--rq <= "11111111"; --latched
		wait for clk_period;
		serialdata <= '1'; --bit 9: odd/even verify - wrong
		--d9 <= '0';
		--wait for clk_period;
		--d9 <= '1'; --should output perr = '1', intn = '0'
		wait for clk_period;
		csn <= '0'; --stop transferring, CPU read int flags
		rdn <= '0';
		addr <= "01"; --should output data(2 downto 0) = "010"
		wait for clk_period;
		rdn <= '1';
		wrn <= '0';
		addr <= "00"; --reset (clrn <= '0')
		wait for clk_period;
		addr <= "10"; --clear int perr
		wait for clk_period;
		addr <= "01"; --clear int buff
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		wait for clk_period;
		
		--case 3: overflow error
		serialdata <= '0'; --bit 0: start bit
		--sq0 <= '0';
		wait for clk_period;
		serialdata <= '1'; --bit 1
		--sq1 <= '0';
		--sq0 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 2
		--sq1 <= '1';
		--sq0 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 3
		wait for clk_period;
		serialdata <= '1'; --bit 4
		wait for clk_period;
		serialdata <= '1'; --bit 5
		wait for clk_period;
		serialdata <= '1'; --bit 6
		wait for clk_period;
		serialdata <= '1'; --bit 7
		wait for clk_period;
		serialdata <= '1'; --bit 8
		--rq <= "11111111"; --latched
		wait for clk_period;
		serialdata <= '0'; --bit 9: odd/even verify
		--sq0 <= '0';
		--d9 <= '0';
		wait for clk_period;
		serialdata <= '1'; --bit 10: end bit 1
		--sq1 <= '0';
		--sq0 <= '1';
		--d9 <= '1';
		wait for clk_period;
		serialdata <= '1'; --bit 11: end bit 2
		--sq1 <= '1';
		--sq0 <= '1';
		--d11 <= '0';
		wait for clk_period;
		serialdata <= '0'; --start a new frame before CPU fetch the last frame's data
		--sq0 <= '0';
		--d11 <= '1'; --should output buff = '1', intn = '0'
		wait for clk_period;
		serialdata <= '1';
		--sq1 <= '0';
		--sq0 <= '1'; --should output oerr = '1'锛焢re?, intn = '0'
		csn <= '0';
		rdn <= '0';
		addr <= "01"; --should output data(2 downto 0) = "101"
		wait for clk_period;
		addr <= "00"; --CPU read buffer, should output data = "11111111"
		wait for clk_period;
		rdn <= '1';
		wrn <= '0';
		addr <= "01"; --clear int buffer, should still output intn = '0'
		wait for clk_period;
		addr <= "11"; --clear int oerr, should output intn = '1'
		wait for clk_period;
		addr <= "00"; --reset (clrn <= '0')
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		wait for clk_period;
      wait;
   end process;

END;
