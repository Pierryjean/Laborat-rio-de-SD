-- É necessário incluir a biblioteca numeric_std para usar o tipo 'unsigned'.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- A entidade de um testbench é sempre vazia.
entity tb_AdderCR_4bit is
end entity tb_AdderCR_4bit;

architecture Test of tb_AdderCR_4bit is

    -- 1. Declaração do componente que será testado (Device Under Test - DUT)
    component AdderCR_4bit is
        port (
            A   : in  unsigned(3 downto 0);
            B   : in  unsigned(3 downto 0);
            Sum : out unsigned(3 downto 0)
        );
    end component AdderCR_4bit;

    -- 2. Sinais internos do testbench para conectar ao DUT
    -- Os sinais devem ser do mesmo tipo das portas do componente (unsigned).
    signal s_A   : unsigned(3 downto 0);
    signal s_B   : unsigned(3 downto 0);
    signal s_Sum : unsigned(3 downto 0);

begin

    -- 3. Instanciação do DUT
    UUT : AdderCR_4bit
        port map (
            A   => s_A,
            B   => s_B,
            Sum => s_Sum
        );

    -- 4. Geração de Estímulos
    -- Cada sinal de entrada tem apenas uma instrução de atribuição concorrente
    -- para evitar conflitos. Os valores futuros são agendados em uma lista.

    -- Estímulos para a entrada 'A'
    s_A <= "0010",              -- t=0ns: Teste 1 (2 + 5)
           "1001" after 10 ns,  -- t=10ns: Teste 2 (9 + 8) -> Overflow
           "0111" after 20 ns,  -- t=20ns: Teste 3 (7 + 8) -> Soma máxima
           "1111" after 30 ns;  -- t=30ns: Teste 4 (15 + 1) -> Overflow

    -- Estímulos para a entrada 'B'
    s_B <= "0101",              -- t=0ns: Teste 1
           "1000" after 10 ns,  -- t=10ns: Teste 2
           "1000" after 20 ns,  -- t=20ns: Teste 3
           "0001" after 30 ns;  -- t=30ns: Teste 4

    -- Resultados esperados na saída 's_Sum':
    -- t=0ns:  Sum = 2 + 5 = 7  ("0111")
    -- t=10ns: Sum = 9 + 8 = 17 -> O resultado é 1 ("0001"), o carry '1' é descartado.
    -- t=20ns: Sum = 7 + 8 = 15 -> ("1111")
    -- t=30ns: Sum = 15 + 1 = 16 -> O resultado é 0 ("0000"), o carry '1' é descartado.

end architecture Test;
