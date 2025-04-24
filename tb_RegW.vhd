library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_RegW is
end tb_RegW;

architecture teste of tb_RegW is

  -- Componente RegW (registrador de 4 bits)
  component RegW is
    generic (
      W : integer := 4
    );
    port (
      clock : in std_logic;
      reset : in std_logic;  
      load  : in std_logic;  
      D     : in std_logic_vector(W-1 downto 0);  
      Q     : out std_logic_vector(W-1 downto 0)  
    );
  end component;

  -- Sinais de estímulos para o testbench
  signal t_clock : std_logic := '0'; 
  signal t_reset : std_logic := '1'; 
  signal t_load  : std_logic := '0'; 
  signal t_D     : std_logic_vector(3 downto 0) := (others => '0'); 
  signal t_Q     : std_logic_vector(3 downto 0); 

begin 

  -- Instanciação do componente RegW com 4 bits
  instancia_RegW: RegW generic map (W => 4) 
    port map(    
      clock => t_clock,
      reset => t_reset,
      load  => t_load, 
      D     => t_D,
      Q     => t_Q
    );

  -- Geração do clock (10 ns de período)
  process
  begin
    while true loop
      t_clock <= '0';
      wait for 10 ps;
      t_clock <= '1';
      wait for 10 ps;
    end loop;
  end process;

  -- estímulos
  process
  begin

    t_reset <= '0';  
    wait for 20 ps;
    t_reset <= '1';  
    wait for 20 ps;

    t_D <= "1101"; 
    t_load <= '1'; 
    wait for 20 ps;
    t_load <= '0';  
    wait for 20 ps;

    t_D <= "1010";  
    wait for 20 ps;
    t_load <= '1';  
    wait for 20 ps;
    t_load <= '0';  

    
    t_reset <= '0';  
    wait for 20 ps;
    t_reset <= '1';  
    wait for 20 ps;

    
    t_D <= "1110";  
    wait for 20 ps;
    t_load <= '1';  
    wait for 20 ps;
    t_load <= '0';  

    
    wait for 20 ps;

    -- Fim da simulação
    wait;
  end process;

end teste;
