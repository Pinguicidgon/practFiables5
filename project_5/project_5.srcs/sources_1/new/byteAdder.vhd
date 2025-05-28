library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity byteAdder is
    port (  A     : in  std_logic_vector(7 downto 0);
            B     : in  std_logic_vector(7 downto 0);
            S     : out std_logic_vector(7 downto 0);
            C_out : out std_logic );
end byteAdder;

architecture Behavioural of byteAdder is
    signal C : std_logic_vector(7 downto 0);

    component fullAdder
        port ( A, B   : in  std_logic;
               C_in   : in  std_logic;
               S      : out std_logic;
               C_out  : out std_logic );
    end component;
begin
    FA0: fullAdder port map(A(0), B(0), '0', S(0), C(0));

    GEN: for i in 1 to 7 generate
        FAx: fullAdder port map(A(i), B(i), C(i-1), S(i), C(i));
    end generate;

    C_out <= C(7);
end Behavioural;
