library ieee;
use ieee.std_logic_1164.all;

entity pseudo_mux is
    port (
        CLOCK   : in    std_logic;  -- clock input
        S       : in    std_logic;  -- control input
        A,B,C,D : in    std_logic;  -- data inputs
        Q       : out   std_logic;  -- data output
        reset   : in    std_logic   -- reset input
    );
end pseudo_mux;


