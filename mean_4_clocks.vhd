library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mean_4_clocks is
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



architecture arch of mean_4_clocks is

signal register1 : unsigned(W - 1 downto 0);
signal register2 : unsigned(W - 1 downto 0);
signal register3 : unsigned(W - 1 downto 0);
signal register4 : unsigned(W - 1 downto 0);
signal output_operation : unsigned( W+1 downto 0);

begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
			register1 <= (others => '0');
			register2 <= (others => '0');
			register3 <= (others => '0');
			register4 <= (others => '0');
			
         elsif (rising_edge(CLK)) then
            register4 <= register3;
				register3 <= register2;
				register2 <= register1;
				register1 <= unsigned(INPUT);
        end if;
        
    end process;
	 
	 output_operation <= (( "00" & register1) + ( "00" & register2) + ( "00" & register3) + ( "00" & register4));
	 OUTPUT <= std_logic_vector( output_operation ( W + 1 downto 2));
    
end arch;