--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:05:06 07/07/2016
-- Design Name:   
-- Module Name:   E:/VHDL/VHDL/fzycomcase/ctrl_tb.vhd
-- Project Name:  fzycomcase
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ctrl
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
 
ENTITY ctrl_tb IS
END ctrl_tb;
 
ARCHITECTURE behavior OF ctrl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ctrl
    PORT(
         d9 : IN  std_logic;
         d11 : IN  std_logic;
         sq0 : IN  std_logic;
         sq1 : IN  std_logic;
         rq : IN  std_logic_vector(7 downto 0);
         clrn : INOUT  std_logic;
         start : OUT  std_logic;
         serial : IN  std_logic;
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
   signal d9 : std_logic := '0';
   signal d11 : std_logic := '0';
   signal sq0 : std_logic := '0';
   signal sq1 : std_logic := '0';
   signal rq : std_logic_vector(7 downto 0) := (others => '0');
   signal serial : std_logic := '0';
   signal clk : std_logic := '0';
   signal csn : std_logic := '0';
   signal wrn : std_logic := '0';
   signal rdn : std_logic := '0';
   signal addr : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal clrn : std_logic;
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal start : std_logic;
   signal intn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ctrl PORT MAP (
          d9 => d9,
          d11 => d11,
          sq0 => sq0,
          sq1 => sq1,
          rq => rq,
          clrn => clrn,
          start => start,
          serial => serial,
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
      --clrn <= 'Z';
		--wait for 100 ns;	
		
		--第一种情况，成功传输数据
		serial <= '0'; --bit 0: 开始
		wait for clk_period/2;
		sq0 <= '0'; --上升沿处传输真正的数据
		wait for clk_period/2;
		serial <= '1'; --bit 1
		wait for clk_period/2;
		sq1 <= '0';
		sq0 <= '1';
		wait for clk_period/2;
		serial <= '1'; --bit 2
		wait for clk_period/2;
		sq1 <= '1';
		sq0 <= '1';
		wait for clk_period/2;
		serial <= '1'; --bit 3
		wait for clk_period;
		serial <= '1'; --bit 4
		wait for clk_period;
		serial <= '1'; --bit 5
		wait for clk_period;
		serial <= '1'; --bit 6
		wait for clk_period;
		serial <= '1'; --bit 7
		wait for clk_period;
		serial <= '1'; --bit 8
		wait for clk_period/2;
		rq <= "11111111"; --latched
		wait for clk_period/2;
		serial <= '0'; --bit 9: 偶校验
		d9 <= '0';
		wait for clk_period/2;
		sq0 <= '0';
		
		wait for clk_period/2;
		serial <= '1'; --bit 10
		d9 <= '1';
		wait for clk_period/2;
		sq1 <= '0';
		sq0 <= '1';
		
		wait for clk_period/2;
		serial <= '1'; --bit 11: 一帧数据传输结束
		d11 <= '0';
		wait for clk_period/2;
		sq1 <= '1';
		sq0 <= '1';
		wait for clk_period/2;
		d11 <= '1'; --结束之后buff = '1', intn = '0'
		wait for clk_period/2; --保持serial='1'到上升沿
		wait for clk_period/2;
		csn <= '0'; --CPU读数据
		rdn <= '0';
		addr <= "01"; --读取状态寄存器数据“001”=oerr、perr、buff
		wait for clk_period;
		addr <= "00"; --读取数据缓冲区数据"11111111"
		wait for clk_period;
		rdn <= '1';
		wrn <= '0';
		addr <= "01"; --清除数据缓冲区
		wait for clk_period;
		addr <= "00"; --复位clrn <= '0'
		rq <= "00000000";
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		wait for clk_period;
		
		--case 2: 数据传输错误，引发校验中断
		serial <= '0'; --bit 0: 开始
		wait for clk_period/2;
		sq0 <= '0';
		wait for clk_period/2;
		serial <= '1'; --bit 1
		wait for clk_period/2;
		sq1 <= '0';
		sq0 <= '1';
		wait for clk_period/2;
		serial <= '1'; --bit 2
		wait for clk_period/2;
		sq1 <= '1';
		sq0 <= '1';
		wait for clk_period/2;
		serial <= '1'; --bit 3
		wait for clk_period;
		serial <= '1'; --bit 4
		wait for clk_period;
		serial <= '1'; --bit 5
		wait for clk_period;
		serial <= '1'; --bit 6
		wait for clk_period;
		serial <= '1'; --bit 7
		wait for clk_period;
		serial <= '1'; --bit 8
		wait for clk_period/2;
		rq <= "11111111"; 
		wait for clk_period/2;
		serial <= '1'; --bit 9: 偶校验错误，应该为‘0’
		d9 <= '0';
		wait for clk_period/2;
		
		wait for clk_period/2;
		serial <= '1'; --bit 10
		d9 <= '1';
		wait for clk_period/2;
		 --校验错误perr = '1', intn = '0'
		wait for clk_period/2;
		csn <= '0'; --停止传输，CPU读数据
		rdn <= '0';
		addr <= "01"; --读取状态标识"010"
		wait for clk_period;
		rdn <= '1';
		wrn <= '0';
		addr <= "10"; -- 清楚偶校验错误
		wait for clk_period;
		addr <= "00"; --复位clrn <= '0'
		rq <= "00000000";
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		wait for clk_period;
		
		--case 3: 数据溢出
		serial <= '0'; --bit 0: 开始
		wait for clk_period/2;
		sq0 <= '0';
		wait for clk_period/2;
		serial <= '1'; --bit 1
		wait for clk_period/2;
		sq1 <= '0';
		sq0 <= '1';
		wait for clk_period/2;
		serial <= '1'; --bit 2
		wait for clk_period/2;
		sq1 <= '1';
		sq0 <= '1';
		wait for clk_period/2;
		serial <= '1'; --bit 3
		wait for clk_period;
		serial <= '1'; --bit 4
		wait for clk_period;
		serial <= '1'; --bit 5
		wait for clk_period;
		serial <= '1'; --bit 6
		wait for clk_period;
		serial <= '1'; --bit 7
		wait for clk_period;
		serial <= '1'; --bit 8
		wait for clk_period/2;
		rq <= "11111111"; --latched
		wait for clk_period/2;
		serial <= '0'; --bit 9: 校验
		d9 <= '0';
		wait for clk_period/2;
		sq0 <= '0';
		
		wait for clk_period/2;
		serial <= '1'; --bit 10
		d9 <= '1';
		wait for clk_period/2;
		sq1 <= '0';
		sq0 <= '1';
		
		wait for clk_period/2;
		serial <= '1'; --bit 11: 结束
		d11 <= '0';
		wait for clk_period/2;
		sq1 <= '1';
		sq0 <= '1';
		
		wait for clk_period/2;
		serial <= '0'; --cpu取走数据之前又开始传输数据
		d11 <= '1'; --传输11位buff = '1', intn = '0'
		wait for clk_period/2;
		sq0 <= '0';
		wait for clk_period/2;
		serial <= '1';
		csn <= '0';
		rdn <= '0';
		addr <= "01"; --读取状态寄存器数据"101"
		wait for clk_period/2;
		sq1 <= '0';
		sq0 <= '1'; --数据溢出oerr = '1', intn = '0'
		wait for clk_period/2;
		addr <= "00"; --CPU读取数据缓冲区数据"11111111"
		wait for clk_period;
		rdn <= '1';
		wrn <= '0';
		addr <= "01"; --清除数据 ，intn = '0'
		wait for clk_period;
		addr <= "11"; --清除数据溢出中断，intn = '1'
		wait for clk_period;
		addr <= "00"; --复位clrn <= '0'
		rq <= "00000000";
		wait for clk_period;
		csn <= '1';
		wrn <= '1';
		wait for clk_period;
      wait;
   end process;

END;
