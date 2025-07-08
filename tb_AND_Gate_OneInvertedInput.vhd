library ieee;
use ieee.std_logic_1164.all;

-- A entidade de um testbench é sempre vazia.
entity tb_AND_Gate_OneInvertedInput is
end entity tb_AND_Gate_OneInvertedInput;

architecture Test of tb_AND_Gate_OneInvertedInput is

    -- 1. Declaração do componente que será testado (Device Under Test - DUT)
    component AND_Gate_OneInvertedInput is
        port (
            A : in  std_logic;
            B : in  std_logic;
            Y : out std_logic
        );
    end component AND_Gate_OneInvertedInput;

    -- 2. Sinais internos do testbench para conectar ao DUT
    signal s_A : std_logic;
    signal s_B : std_logic;
    signal s_Y : std_logic;

begin

    -- 3. Instanciação do DUT
    UUT : AND_Gate_OneInvertedInput
        port map (
            A => s_A,
            B => s_B,
            Y => s_Y
        );

    -- 4. Geração de Estímulos
    -- Testaremos todas as 4 combinações de entrada possíveis.

    -- Estímulos para a entrada 'A'
    s_A <= '0',
           '1' after 20 ns;

    -- Estímulos para a entrada 'B'
    s_B <= '0',
           '1' after 10 ns,
           '0' after 20 ns,
           '1' after 30 ns;

    -- Tabela verdade e resultados esperados na saída 's_Y':
    -- ---------------------------------
    -- Tempo  | s_A | s_B | Y = A and (not B)
    -- ---------------------------------
    -- 0ns    |  0  |  0  | Y = 0 and 1 = 0
    -- 10ns   |  0  |  1  | Y = 0 and 0 = 0
    -- 20ns   |  1  |  0  | Y = 1 and 1 = 1
    -- 30ns   |  1  |  1  | Y = 1 and 0 = 0
    -- ---------------------------------

end architecture Test;
