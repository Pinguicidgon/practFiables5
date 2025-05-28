library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_byteAdder is
end tb_byteAdder;

architecture Testbench of tb_byteAdder is
    signal A     : std_logic_vector(7 downto 0) := (others => '0');
    signal B     : std_logic_vector(7 downto 0) := (others => '0');
    signal S     : std_logic_vector(7 downto 0);
    signal C_out : std_logic;

    component byteAdder
        port (
            A     : in  std_logic_vector(7 downto 0);
            B     : in  std_logic_vector(7 downto 0);
            S     : out std_logic_vector(7 downto 0);
            C_out : out std_logic
        );
    end component;
begin
    UUT: byteAdder port map(A, B, S, C_out);

    process
    begin
        -- Caso 1: 5 + 10 = 15
        A <= std_logic_vector(to_unsigned(5, 8));
        B <= std_logic_vector(to_unsigned(10, 8));
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(15, 8)) and C_out = '0'
            report "Error: 5 + 10 /= 15" severity error;

        -- Caso 2: 255 + 1 = 0 con acarreo
        A <= std_logic_vector(to_unsigned(255, 8));
        B <= std_logic_vector(to_unsigned(1, 8));
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(0, 8)) and C_out = '1'
            report "Error: 255 + 1 /= 0 con carry" severity error;

        -- Caso 3: 100 + 55 = 155 sin carry
        A <= std_logic_vector(to_unsigned(100, 8));
        B <= std_logic_vector(to_unsigned(55, 8));
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(155, 8)) and C_out = '0'
            report "Error: 100 + 55 /= 155" severity error;

        -- Caso 4: 128 + 127 = 255 sin carry
        A <= std_logic_vector(to_unsigned(128, 8));
        B <= std_logic_vector(to_unsigned(127, 8));
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(255, 8)) and C_out = '0'
            report "Error: 128 + 127 /= 255" severity error;

        -- Caso 5: 200 + 100 = 44 con carry
        A <= std_logic_vector(to_unsigned(200, 8));
        B <= std_logic_vector(to_unsigned(100, 8));
        wait for 10 ns;
        assert S = std_logic_vector(to_unsigned(44, 8)) and C_out = '1'
            report "Error: 200 + 100 /= 44 con carry" severity error;

        wait;
    end process;
end Testbench;
