library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    port (  A     : in  std_logic;
            B     : in  std_logic;
            C_in  : in  std_logic;
            S     : out std_logic;
            C_out : out std_logic );
end fullAdder;

architecture Behavioural of fullAdder is
    signal S1, C1, C2 : std_logic;

    component halfAdder
        port ( A, B   : in  std_logic;
               S      : out std_logic;
               C_out  : out std_logic );
    end component;
begin
    HA1: halfAdder port map(A, B, S1, C1);
    HA2: halfAdder port map(S1, C_in, S, C2);
    C_out <= C1 or C2;
end Behavioural;
