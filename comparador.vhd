library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparador is
    generic (
        DATA_WIDTH : natural := 16
    );
    port (
        a      : in  STD_LOGIC_VECTOR((DATA_WIDTH - 1) downto 0);
        b      : in  STD_LOGIC_VECTOR((DATA_WIDTH - 1) downto 0);
        maior  : out STD_LOGIC;
        menor  : out STD_LOGIC;
        igual  : out STD_LOGIC
    );
end comparador;

architecture comportamento of comparador is
    signal a_signed, b_signed : signed((DATA_WIDTH - 1) downto 0);
begin
    
    a_signed <= signed(a);
    b_signed <= signed(b);

    maior <= '1' when a_signed > b_signed else '0';
    menor <= '1' when a_signed < b_signed else '0';
    igual <= '1' when a_signed = b_signed else '0';

end comportamento;