library IEEE;

use IEEE.STD_LOGIC_1164.all;

use ieee.numeric_std.all;
 
entity tb_mean_4_clocks is

end tb_mean_4_clocks;
 
architecture teste of tb_mean_4_clocks is
 
  -- Componente RegW (registrador de 4 bits)

  component mean_4_clocks is

      generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );
end component;
    
	constant W : integer := 4;
  -- Sinais de estímulos para o testbench

  signal clk : std_logic := '0'; 

  signal reset : std_logic ; 

  signal input : std_logic_vector (W - 1 downto 0 ); 
  
  signal output : std_logic_vector (W-1 downto 0);
  
  constant period_of_clk : time := 10 ns;

  
begin
 
	
  -- Instanciação do componente mean_4_clocks. 

  instancia_mean_4_clocks : mean_4_clocks generic map (W => W)
    port map(    

      CLK => clk,

      RESET => reset,

      INPUT  => input, 

      OUTPUT  => output

    );
 
process	
begin 
	
	while true loop 
	clk <= '0'; 
	wait for period_of_clk/ 2; 
	clk <= '1'; 
	wait for period_of_clk / 2; 
	
	end loop; 
	
end process;

 reset <= '1', '0' after 5 ns;
 input <= x"2", x"F" after 100 ns;
 


end teste;