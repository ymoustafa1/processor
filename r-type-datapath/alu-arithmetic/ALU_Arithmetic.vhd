library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Arithmetic is
    port (
        data1, data2 : in std_logic_vector(31 downto 0);
        aluop : in std_logic_vector(3 downto 0);
        result : out std_logic_vector(31 downto 0)
    );
end entity;

architecture behaviour of ALU_Arithmetic is
begin
    process(data1, data2, aluop)
    begin
        if aluop = "0010" then
            result <= std_logic_vector(signed(data1)+signed(data2));
        elsif aluop = "0110" then
            result <=std_logic_vector(signed(data1)-signed(data2));
        elsif aluop="0111" then
            result<= (others => '0');
            if signed(data1) < signed(data2) then
                result(0) <= '1';
            end if;
        else
            result <= (others => '0');
        end if;
    end process;
end architecture;