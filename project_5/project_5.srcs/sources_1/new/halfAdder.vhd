library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    port (  A     : in  std_logic;
            B     : in  std_logic;
            S     : out std_logic;
            C_out : out std_logic );
end halfAdder;

architecture Behavioural of halfAdder is
begin
    S <= A xor B;
    C_out <= A and B;
end Behavioural;
