----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:50 07/07/2016 
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity ctrl is
    Port ( d9 : in  STD_LOGIC;
           d11 : in  STD_LOGIC;
           sq0 : in  STD_LOGIC;
           sq1 : in  STD_LOGIC;
           rq : in  STD_LOGIC_VECTOR (7 downto 0);
           clrn : inout  STD_LOGIC;
           start : out  STD_LOGIC;
           serial : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           csn : in  STD_LOGIC;
           wrn : in  STD_LOGIC;
           rdn : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
			  data : inout  STD_LOGIC_VECTOR (7 downto 0);
           intn : out  STD_LOGIC);
end ctrl;

architecture Behavioral of ctrl is
	signal clrint1, clrint2, clrint3, rbuff, rint : std_logic; --�ж������־�������־
	signal startm, odd, endd, perr, oerr, buff : std_logic := '0'; --״̬��־���жϱ�־
begin
	process(csn, wrn, addr) --д����
	begin
		clrn <= '1';
		clrint1 <= '1';
		clrint2 <= '1';
		clrint3 <= '1'; --��ʼ�����ж�
		if csn = '0' and wrn = '0' then
			case addr is --Ƭѡ����д���ǵ͵�ƽ��Ч				
				when "00" => clrn <= '0'; --��λ
				when "01" => clrint1 <= '0'; --���1���жϣ���ȷ����
				when "10" => clrint2 <= '0'; --���2���жϣ�У�����
				when "11" => clrint3 <= '0'; --���3���жϣ��������
				when others => null;
			end case;
		end if;
	end process;
	
	process(csn, rdn, addr) --������
	begin
		rbuff <= '1';
		rint <= '1'; 	--δѡ�л򲻶�ȡʱ����Ϊ1����������Ϊ��
		if csn = '0' and rdn = '0' then
			case addr is
				when "00" => rbuff <= '0'; --������������			
				when "01" => rint <= '0'; --�����ж�״̬				
				when others => null;
			end case;
		end if;
	end process;
	
	process(sq0, rq) --żУ��
	begin
		odd <= sq0 xor rq(0) xor rq(1) xor rq(2) xor rq(3) xor rq(4) xor rq(5) xor rq(6) xor rq(7);
	end process;
	
	process(sq0, sq1) --�����ж�
	begin
		endd <= sq0 and sq1;
	end process;
	
	process(clrn, clk)--��ʼλ�ı�
	begin
		if clrn = '0' then
			startm <= '0';
		elsif clk = '1' and clk'event then
			startm <= not serial; 
		end if;
	end process;
	
	process(clrn, startm)
	begin
		if clrn = '0' then
			start <= '0';
		elsif startm  = '1' and startm'event then
			start <= '1'; --��ʼ������
		end if;
	end process;
	
	process(clrint2, d9) --У��
	begin
		if clrint2 = '0' then
			perr <= '0';
		elsif d9 = '1' and d9'event then 
			perr <= odd;
		end if;
	end process;
	
	process(clrint1, d11) --һ֡���ݴ�������
	begin
		if clrint1 = '0' then
			buff <= '0';
		elsif d11='1' and d11'event then 
			buff <= endd; 
		end if;
	end process;
	
	process(clrint3, startm) --���
	begin
		if clrint3 = '0' then
			oerr <= '0';
		elsif startm = '1' and startm'event then
			oerr <= buff; 
		end if;
	end process;
	
	process(perr, oerr, buff)--�ж�
	begin
		intn <= not (perr or oerr or buff);
	end process;

	process(rbuff, rint, perr, oerr, buff, rq)--����ͨ��
	begin
		if rbuff = '0' then 			
			data <= rq;
		elsif rint = '0' then 
			data(0) <= buff;
			data(1) <= perr;
			data(2) <= oerr;
			data(7 downto 3) <= "00000";
		else
			data <= "ZZZZZZZZ"; 
		end if;
	end process;
end Behavioral;

