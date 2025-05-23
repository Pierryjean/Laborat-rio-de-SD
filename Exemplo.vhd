library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Caminho_de_Dados is
    Port (
        Clock    : in  STD_LOGIC;
        E        : in  STD_LOGIC_VECTOR(3 downto 0);
        Load_E   : in  STD_LOGIC;
        Load_SD  : in  STD_LOGIC;
        Sobe     : out STD_LOGIC;
        Desce    : out STD_LOGIC;
        Media    : out STD_LOGIC_VECTOR(3 downto 0);
        Display  : out STD_LOGIC_VECTOR(6 downto 0)
    );
end Caminho_de_Dados;

architecture Estrutural of Caminho_de_Dados is

    signal SigE     : STD_LOGIC_VECTOR(3 downto 0);
    signal SigM     : STD_LOGIC_VECTOR(3 downto 0);
    signal SigSobe  : STD_LOGIC;
    signal SigDesce : STD_LOGIC;
    signal SigSD    : STD_LOGIC_VECTOR(1 downto 0);

    signal SD_input : STD_LOGIC_VECTOR(1 downto 0);

    component RegW
        generic (W : integer := 4);
        port (
            Clock : in  STD_LOGIC;
            Reset : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(W-1 downto 0);
            Q     : out STD_LOGIC_VECTOR(W-1 downto 0)
        );
    end component;

    component Reg_MA
        Port (
            Clock : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(3 downto 0);
            Q     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component Comparador
        Port (
            a      : in  STD_LOGIC_VECTOR(3 downto 0);
            b      : in  STD_LOGIC_VECTOR(3 downto 0);
            maior  : out STD_LOGIC;
            menor  : out STD_LOGIC
        );
    end component;

    component BCD_7seg
        Port (
            entrada : in  STD_LOGIC_VECTOR(3 downto 0);
            saida   : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

begin

    SD_input <= SigSobe & SigDesce;

    U_RegE: RegW
        generic map (W => 4)
        port map (
            Clock => Clock,
            Reset => '0',      
            LOAD  => Load_E,
            D     => E,
            Q     => SigE
        );

    U_MA: Reg_MA
        port map (
            Clock => Clock,
            D     => SigE,
            Q     => SigM
        );

    U_Comp: Comparador
        port map (
            a     => SigE,
            b     => SigM,
            maior => SigSobe,
            menor => SigDesce
        );

    U_RegSD: RegW
        generic map (W => 2)
        port map (
            Clock => Clock,
            Reset => '0',     
            LOAD  => Load_SD,
            D     => SD_input,
            Q     => SigSD
        );

    Sobe  <= SigSD(1);
    Desce <= SigSD(0);
    Media <= SigM;

    U_Display: BCD_7seg
        port map (
            entrada => SigM,
            saida   => Display
        );

end Estrutural;
