----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Hamid Reza Mehrabian
-- 
-- Create Date:    19:41:58 01/14/2018 
-- Design Name: 
-- Module Name:    SE2X2 - Behavioral 
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

entity SE2X2 is
    Port ( IN1 : in  STD_LOGIC_VECTOR (7 downto 0);
           IN2 : in  STD_LOGIC_VECTOR (7 downto 0);
           OUT1 : out  STD_LOGIC_VECTOR (7 downto 0);
           OUT2 : out  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0));
end SE2X2;

architecture Behavioral of SE2X2 is

begin

with SEL select OUT1 <=
    IN1 when "00",
    IN1 when "01",
    IN2 when "10",
    IN2 when "11";

with SEL select OUT2 <=
    IN2 when "00",
    IN1 when "01",
    IN2 when "10",
    IN1 when "11";
	 
end Behavioral;

