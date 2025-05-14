library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pseudo_mux is
end tb_pseudo_mux;

architecture teste of tb_pseudo_mux is

component pseudo_mux is
    port (
        CLOCK   : in    std_logic;  -- clock input
        S       : in    std_logic;  -- control input
        A,B,C,D : in    std_logic;  -- data inputs
        Q       : out   std_logic;  -- data output
        reset   : in    std_logic   -- reset input
    );
	 end component;
	 
	  -- Sinais de estímulos para o testbench
  signal t_clock, t_reset, t_S, t_A, t_B, t_C, t_D, t_Q : std_logic := '0'; 
   
begin 

  -- Instanciação do componente RegW com 4 bits
  instancia_pseudo_mux : pseudo_mux 
    port map(    
      clock => t_clock,
      reset => t_reset,
      S  => t_S, 
      Q  => t_Q,
		A  => t_A,
		B  => t_B,
		C  => t_C,
		D  => t_D
    );

  -- Geração do clock (10 ns de período)
  
  t_clock <= not t_clock after 5 ns;
  
  t_s <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 80 ns; 
  t_A <= '1', '0' after 5 ns;
  t_B <= '0', '1' after 15 ns, '0' after 25 ns;
  t_C <= '0', '1' after 35 ns, '0' after 45 ns;
  t_D <= '0', '1' after 55 ns, '0' after 65 ns;
  
  
end teste;
