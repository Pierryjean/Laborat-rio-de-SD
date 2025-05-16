library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_comparador is
end tb_comparador;

architecture teste of tb_comparador is

component comparador is 

	generic
	(
		DATA_WIDTH : natural := 16
	);

	port 
	(
		a	: in std_logic_vector	((DATA_WIDTH-1) downto 0);
		b	: in std_logic_vector	((DATA_WIDTH-1) downto 0);
		maior	: out std_logic;
		menor	: out std_logic;
		igual	: out std_logic
	);

end component;

signal fio_A, fio_B: std_logic_vector(3 downto 0);
signal fio_maior, fio_menor, fio_igual: std_logic;

begin

-- Note que o componente é instanciado com apenas 4 bits nas entradas para facilitar a simulação:
instancia_comparador: comparador generic map (DATA_WIDTH => 4) port map(a=>fio_A,b=>fio_B,maior=>fio_maior, menor=>fio_menor,igual=>fio_igual);

-- Dados de entrada de 4 bits são expressos em "hexadecimal" usando "x":
fio_A <= x"0", x"8" after 20 ns, x"7" after 40 ns, x"4" after 60 ns;
fio_B <= x"0", x"7" after 10 ns, x"8" after 30 ns, x"1" after 50 ns;
end teste;