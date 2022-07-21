----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  		Hamidreza Mehrabian
-- 
-- Create Date:    21:03:50 01/14/2018 
-- Design Name: 
-- Module Name:    SEN - Behavioral 
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
use ieee.numeric_std.all;

----------------------------------------------------------------
--     __________                    __________                      __________                    
-- ___|          |__________________|          |____________________|          |___
--    |          |                  |  SE 10   |                    |  SE 20   |
--    |  SE 00   |                  |          |                    |          |
--    |          |                  |          |                    |          |
-- ___|          |____             _|          |_                  _|          |___
--    |__________|    \           / |__________|                    |__________|                    
--                     \         /
--                      \       /
--                       \     /
--                        \   / 
--     __________          \ /       __________                      __________                    
-- ___|          |_         \_______|          |_                  _|          |___
--    |  SE 01   |         /        |  SE 11   |                    |  SE 21   |
--    |          |        /         |          |                    |          |
--    |          |       /          |          |                    |          |
-- ___|          |_     /          _|          |_                  _|          |___
--    |__________| |   /            |__________|                    |__________|                    
--                 |  /
--                 | /
--                  /
--                 / \
--     __________  |  \              __________                      __________                    
-- ___|          |_|   \           _|          |_                  _|          |___
--    |  SE 02   |      \           |  SE 12   |                    |  SE 22   |
--    |          |       \          |          |                    |          |
--    |          |        \         |          |                    |          |
-- ___|          |_        \       _|          |_                  _|          |___
--    |__________|          \       |__________|                    |__________|                    
--                           \
--                            \ 
--                             \
--                              \
--     __________                \   __________                      __________                    
-- ___|          |_               \_|          |_                  _|          |___
--    |  SE 03   |                  |  SE 13   |                    |  SE 23   |
--    |          |                  |          |                    |          |
--    |          |                  |          |                    |          |
-- ___|          |__________________|          |____________________|          |___
--    |__________|                  |__________|                    |__________|                    
--
--
--





entity sen is
	Port ( 
	INPUT1 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT2 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT3 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT4 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT5 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT6 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT7 : in STD_LOGIC_VECTOR(7 downto 0);
	INPUT8 : in STD_LOGIC_VECTOR(7 downto 0);
	
	OUTPUT1 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT2 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT3 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT4 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT5 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT6 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT7 : out STD_LOGIC_VECTOR(7 downto 0);
	OUTPUT8 : out STD_LOGIC_VECTOR(7 downto 0);
	
	DES : in STD_LOGIC_VECTOR(2 downto 0) := "111";
	SRC : in STD_LOGIC_VECTOR(2 downto 0) := "000");
end sen;

architecture Behavioral of sen is
-- 8x8 Shuffle-Exchange Network

component SE2X2
    Port ( IN1 : in  STD_LOGIC_VECTOR (7 downto 0);
           IN2 : in  STD_LOGIC_VECTOR (7 downto 0);
           OUT1 : out  STD_LOGIC_VECTOR (7 downto 0);
           OUT2 : out  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0) := "00");
end component;


signal OUTPUT01 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT02 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT03 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT04 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT05 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT06 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT07 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT08 : STD_LOGIC_VECTOR(7 downto 0);
	
signal OUTPUT11 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT12 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT13 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT14 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT15 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT16 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT17 : STD_LOGIC_VECTOR(7 downto 0);
signal OUTPUT18 : STD_LOGIC_VECTOR(7 downto 0);


signal IDX0 : STD_LOGIC_VECTOR(1 downto 0);
signal IDX1 : STD_LOGIC_VECTOR(1 downto 0);
signal IDX2 : STD_LOGIC_VECTOR(1 downto 0);

signal D0 : STD_LOGIC;
signal D1 : STD_LOGIC;
signal D2 : STD_LOGIC;

signal D00 : STD_LOGIC_VECTOR(1 downto 0);
signal D11 : STD_LOGIC_VECTOR(1 downto 0);
signal D22 : STD_LOGIC_VECTOR(1 downto 0);

signal SEL00 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL01 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL02 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL03 : STD_LOGIC_VECTOR(1 downto 0);

signal SEL10 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL11 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL12 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL13 : STD_LOGIC_VECTOR(1 downto 0);

signal SEL20 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL21 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL22 : STD_LOGIC_VECTOR(1 downto 0);
signal SEL23 : STD_LOGIC_VECTOR(1 downto 0);

begin



se00 : SE2X2 port map (INPUT1,INPUT2,OUTPUT01,OUTPUT02,SEL00);
se01 : SE2X2 port map (INPUT3,INPUT4,OUTPUT03,OUTPUT04,SEL01);
se02 : SE2X2 port map (INPUT5,INPUT6,OUTPUT05,OUTPUT06,SEL02);
se03 : SE2X2 port map (INPUT7,INPUT8,OUTPUT07,OUTPUT08,SEL03);

se10 : SE2X2 port map (OUTPUT01,OUTPUT05,OUTPUT11,OUTPUT12,SEL10);
se11 : SE2X2 port map (OUTPUT02,OUTPUT06,OUTPUT13,OUTPUT14,SEL11);
se12 : SE2X2 port map (OUTPUT03,OUTPUT07,OUTPUT15,OUTPUT16,SEL12);
se13 : SE2X2 port map (OUTPUT04,OUTPUT08,OUTPUT17,OUTPUT18,SEL13);

se20 : SE2X2 port map (OUTPUT11,OUTPUT15,OUTPUT1,OUTPUT2,SEL20);
se21 : SE2X2 port map (OUTPUT12,OUTPUT16,OUTPUT3,OUTPUT4,SEL21);
se22 : SE2X2 port map (OUTPUT13,OUTPUT17,OUTPUT5,OUTPUT6,SEL22);
se23 : SE2X2 port map (OUTPUT14,OUTPUT18,OUTPUT7,OUTPUT8,SEL23);

IDX0 <= SRC(2) & SRC(1);
D0 <= DES(2) xor SRC(0);
IDX1 <= SRC(1) & DES(2);
D1 <= DES(1) xor SRC(2);
IDX2 <= DES(2) & DES(1);
D2 <= DES(0) xor SRC(1);

D00 <= D0 & D0;
D11 <= D1 & D1;
D22 <= D2 & D2;

	 
SEL00 <= D00 when IDX0 = "00";
SEL01 <= D00 when IDX0 = "01";
SEL02 <= D00 when IDX0 = "10";
SEL03 <= D00 when IDX0 = "11";

SEL10 <= D11 when IDX1 = "00";
SEL11 <= D11 when IDX1 = "01";
SEL12 <= D11 when IDX1 = "10";
SEL13 <= D11 when IDX1 = "11";

SEL20 <= D22 when IDX2 = "00";
SEL21 <= D22 when IDX2 = "01";
SEL22 <= D22 when IDX2 = "10";
SEL23 <= D22 when IDX2 = "11";



end Behavioral;