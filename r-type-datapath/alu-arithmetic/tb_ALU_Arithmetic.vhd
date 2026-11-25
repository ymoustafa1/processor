library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ALU_Arithmetic is
end tb_ALU_Arithmetic;

architecture behaviour of tb_ALU_Arithmetic is

    signal data1, data2 : std_logic_vector(31 downto 0):= (others => '0');
    signal aluop : std_logic_vector(3 downto 0);
    signal result : std_logic_vector(31 downto 0);
begin
    uut: entity work.ALU_Arithmetic
        port map(data1 => data1, data2 => data2, aluop => aluop, result => result);
        stim: process
        begin
            data1 <= x"00000001"; data2 <= x"00000001"; 
            aluop <= "0010"; wait for 10 ns; -- add
            aluop <= "0110"; wait for 10 ns; -- sub
            aluop <= "0111"; wait for 10 ns; -- slt
            data1<= x"0000000F"; data2<= x"0000000A"; 
            aluop <= "0010"; wait for 10 ns; -- add
            aluop <= "0110"; wait for 10 ns; -- sub
            aluop <= "0111"; wait for 10 ns; -- slt
            data1 <= x"0000000A"; data2<= x"0000000F";
            aluop <= "0010"; wait for 10 ns; -- add
            aluop <= "0110"; wait for 10 ns; -- sub
            aluop <= "0111"; wait for 10 ns; -- slt
            aluop <= "0000"; wait for 10 ns; -- default
            wait;
        end process stim;
end architecture;