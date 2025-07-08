library ieee;
use ieee.std_logic_1164.all;

-- A entidade de um testbench é sempre vazia.
entity tb_AND_Gate_OneInvertedInput2 is
end entity tb_AND_Gate_OneInvertedInput2;

architecture Test of tb_AND_Gate_OneInvertedInput2 is

    -- 1. Declaração do componente que será testado (Device Under Test - DUT)
    component AND_Gate_OneInvertedInput2 is
        port (
            A : in  std_logic_vector(15 downto 0);
            B : in  std_logic_vector(15 downto 0);
            Y : out std_logic_vector(15 downto 0)
        );
    end component AND_Gate_OneInvertedInput2;

    -- 2. Sinais internos do testbench para conectar ao DUT
    signal s_A : std_logic_vector(15 downto 0);
    signal s_B : std_logic_vector(15 downto 0);
    signal s_Y : std_logic_vector(15 downto 0);

begin

    -- 3. Instanciação do DUT
    UUT : AND_Gate_OneInvertedInput2
        port map (
            A => s_A,
            B => s_B,
            Y => s_Y
        );

    -- 4. Geração de Estímulos
    -- Cada sinal de entrada tem apenas uma instrução de atribuição concorrente.
    -- Os valores futuros são agendados numa lista, separados por vírgulas.

    -- Estímulos para a entrada 'A'
    s_A <= x"FFFF",              -- t=0ns: Teste 1
           x"FFFF" after 10 ns,  -- t=10ns: Teste 2
           x"AAAA" after 20 ns,  -- t=20ns: Teste 3
           x"F0F0" after 30 ns;  -- t=30ns: Teste 4

    -- Estímulos para a entrada 'B'
    s_B <= x"0000",              -- t=0ns: Teste 1
           x"FFFF" after 10 ns,  -- t=10ns: Teste 2
           x"AAAA" after 20 ns,  -- t=20ns: Teste 3
           x"0F0F" after 30 ns;  -- t=30ns: Teste 4

    -- Resultados esperados na saída 's_Y' (Y = A and (not B)):
    -- t=0ns:  Y = FFFF and (not 0000) = FFFF and FFFF = FFFF
    -- t=10ns: Y = FFFF and (not FFFF) = FFFF and 0000 = 0000
    -- t=20ns: Y = AAAA and (not AAAA) = AAAA and 5555 = 0000
    -- t=30ns: Y = F0F0 and (not 0F0F) = F0F0 and F0F0 = F0F0

end architecture Test;
