-- pseudo_mux - A Finite State Machine that mimics the behavior of mux
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

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

architecture comportamental of pseudo_mux is
    type estado is (S0, S1, S2, S3);
    signal estado_atual, proximo_estado : estado;
begin

    -- Process de transição de estado (sincronizado com CLOCK e reset)
    process (CLOCK, reset)
    begin
        if reset = '1' then
            estado_atual <= S0;
        elsif rising_edge(CLOCK) then
            estado_atual <= proximo_estado;
        end if;
    end process;

    -- Process de lógica combinacional (definição de saída e próximo estado)
    process (estado_atual, S, A, B, C, D)
    begin
        case estado_atual is
            when S0 =>
                Q <= A;
                if S = '1' then
                    proximo_estado <= S1;
                else
                    proximo_estado <= S0;
                end if;

            when S1 =>
                Q <= B;
                if S = '1' then
                    proximo_estado <= S2;
                else
                    proximo_estado <= S1;
                end if;

            when S2 =>
                Q <= C;
                if S = '1' then
                    proximo_estado <= S3;
                else
                    proximo_estado <= S2;
                end if;

            when S3 =>
                Q <= D;
                if S = '1' then
                    proximo_estado <= S0;
                else
                    proximo_estado <= S3;
                end if;
        end case;
    end process;

end comportamental;
