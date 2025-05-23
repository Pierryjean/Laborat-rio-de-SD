library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Datapath is 

port (

	E : in std_logic_vector (3 downto 0);
	Load_E : in std_logic;
	Reset_MA : in std_logic;
	Clock : in std_logic;
	Descendo: in std_logic;
	Subindo: in std_logic;
	Atualize : in std_logic;
	Maior: out std_logic;
	Menor: out std_logic;
	Sobe : out std_logic;
	Desce: out std_logic;
	MediaDseteseg: out std_logic_vector ( 3 downto 0)
	);
	end Datapath;
	
architecture structural of Datapath is

	component mean_4_clocks(
	 generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );
end mean_4_clocks;

	component RegW(
	  generic (
		 W : integer := 8  
	  );
	  port (
		 clock : in std_logic;
		 reset : in std_logic;  
		 load  : in std_logic;  
		 D     : in std_logic_vector(W-1 downto 0);  
		 Q     : out std_logic_vector(W-1 downto 0)  
	  );
	end RegW;
	
	component Comparador( 
	generic (
        DATA_WIDTH : natural := 16
    );
    port (
        a      : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
        b      : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
        maior  : out std_logic;
        menor  : out std_logic;
        igual  : out std_logic
    );
	end comparador;

	component Bcd_7seg(
	port (
	entrada: in std_logic_vector (3 downto 0);
	saida: out std_logic_vector (6 downto 0)
	);
	end Bcd_7seg;
	
	signal SigE : std_logic_vector ( 3 downto 0);
	signal SigM : std_logic_vector ( 3 downto 0);
	signal Sobe : std_logic;
	signal Desce: std_logic; 
	signal UpDown : std_logic_vector (1 downto 0); -- Acredito que é a maneira de declarar o sinal interno das entradas (Subindo e Descendo) Declarar um Bit para cada um.
	
	-- Instanciar os componentes e interligá-los.
	-- Construir Testbench
	--
