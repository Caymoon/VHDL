----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:44 07/07/2016 
-- Design Name: 
-- Module Name:    fzycomcase - Behavioral 
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

entity fzycomcase is
    Port ( serialdata : in  STD_LOGIC;--串行数据
           clk : in  STD_LOGIC;
           csn : in  STD_LOGIC;--低电平有效
           wrn : in  STD_LOGIC;--低电平有效
           rdn : in  STD_LOGIC;--低电平有效
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);--数据总线
           intn : out  STD_LOGIC);--低电平有效
end fzycomcase;

architecture Behavioral of fzycomcase is
	component ctrl is --控制逻辑模块
		port(
		d9, d11: in std_logic;
		sq0, sq1: in std_logic;
		rq: in std_logic_vector(7 downto 0);
		clrn: inout std_logic;
		start: out std_logic;
		serial, clk: in std_logic;
		csn, wrn, rdn: in std_logic;
		addr: in std_logic_vector(1 downto 0);
		data: inout std_logic_vector(7 downto 0);
		intn: out std_logic
		);
	end component;
	
	component decode4 is --译码器模块
		port(
		d: in std_logic_vector(3 downto 0);
		enable: in std_logic;
		q8,q9,q11: out std_logic
		);
	end component;
	
	component reg8 is --锁存器模块
		port(
		clrn, clk:in std_logic;
		d:in std_logic_vector(7 downto 0);
		q: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component sreg is --移位寄存器模块
		port(
		clk, clrn, serial:in std_logic;
		q: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component count4 is --计数器模块
		port(
		clk: in std_logic;
		clrn: in std_logic;
		q:out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal c:std_logic_vector(3 downto 0);
	signal start, t8, t9, t11, clrn:std_logic;
	signal tdata:std_logic_vector(7 downto 0);
	signal treg:std_logic_vector(7 downto 0);
	
begin
	CtrlUnit: ctrl PORT MAP (
          d9 => t9,
          d11 => t11,
          sq0 => tdata(0),
          sq1 => tdata(1),
          rq => treg,--rq是锁存器
          clrn => clrn,--系统复位
          start => start,
          serial => serialdata,
          clk => clk,
          csn => csn,
          wrn => wrn,
          rdn => rdn,
          addr => addr,
          data => data,
          intn => intn
        );
		  
   CountUnit: count4 PORT MAP ( --计数器
          clk => clk,
          clrn => start,
          q => c
        );
		  
	DecodeUnit: decode4 PORT MAP (--译码器
			 d => c,
			 enable => start,
			 q8 => t8,
			 q9 => t9,
			 q11 => t11
		  );
	
	ShiftUnit: sreg PORT MAP (--移位寄存器
			  clk => clk,
			  clrn => start,
			  serial => serialdata,
			  q => tdata
		  );
		  
	RegUnit: reg8 PORT MAP (--锁存器
			  clrn => clrn,
			  clk => t8,
			  d => tdata,
			  q => treg
		  );
end Behavioral;

