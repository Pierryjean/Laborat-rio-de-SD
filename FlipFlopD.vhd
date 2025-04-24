-- codificação dataflow
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlopD is

	port ( clock : in STD_LOGIC;
	D : in STD_LOGIC;
	Q : out STD_LOGIC );
	
end FlipFlopD;

architecture dataflow of FlipFlopD is

	begin
	Q <= D when rising_edge(clock);
	
end dataflow;