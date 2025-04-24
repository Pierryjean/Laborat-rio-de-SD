library IEEE;
use IEEE.std_logic_1164.ALL;

entity RegW is
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

architecture dataflow of RegW is
begin

  -- Reset assíncrono e Load síncrono
  Q <= (others => '0') when (reset = '0') else
       D when (load = '1' and rising_edge(clock));
         -- Mantém o valor atual de Q caso não tenha Reset nem Load

end dataflow;
