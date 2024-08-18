LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY test IS
PORT(lane, ir: IN STD_LOGIC;
	  BRC, BRA, BLC, BLA: OUT STD_LOGIC;
	  FRC, FRA, FLC, FLA: OUT STD_LOGIC;
	  led1,led2,led3,led4,led5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END test;

ARCHITECTURE testarch OF test IS
BEGIN 

PROCESS(ir) 
BEGIN

if ir='0' then--obstacle stop
		BRC<='0';
		BRA<='0';
		BLC<='0';
		BLA<='0';
		FRC<='0';
		FRA<='0';
		FLC<='0';
		FLA<='0';
else--no obstacle go
		BRC<='0';
		BRA<='1';
		BLC<='1';
		BLA<='0';
		FRC<='0';
		FRA<='1';
		FLC<='0';
		FLA<='1';
end if;

END PROCESS;

PROCESS(lane) 
BEGIN

if lane='0' then--out of lane no alert 
		led1 <= "0001000";--a
	   led2 <= "1000111";--l
	   led3 <= "0000110";--e
	   led4 <= "0101111";--r
	   led5 <= "0000111";--t 
else--in lane no alert
      led1 <= "1111111";
		led2 <= "1111111";
		led3 <= "1111111";
		led4 <= "1111111";
		led5 <= "1111111"; 
end if;

END PROCESS;

END testarch;

		

		