library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ALU is
end tb_ALU;

architecture behavior of tb_ALU is
    signal data1, data2 : std_logic_vector(31 downto 0) := (others => '0');
    signal aluop : std_logic_vector(3 downto 0)  := (others => '0');
    signal dataout : std_logic_vector(31 downto 0);
    signal zflag : std_logic;

begin
    uut : entity work.ALU
    port map(
        data1   => data1,
        data2   => data2,
        aluop   => aluop,
        dataout => dataout,
        zflag   => zflag
    );

    stim_proc : process
    begin
        data1 <= x"0000000A"; -- = 10
        data2 <= x"0000000E"; -- = 14

        aluop <= "0000"; wait for 100 ns; -- AND
        aluop <= "0001"; wait for 100 ns; -- OR
        aluop <= "1100"; wait for 100 ns; -- NOR
        aluop <= "0010"; wait for 100 ns; -- ADD
        aluop <= "0110"; wait for 100 ns; -- SUB
        aluop <= "0111"; wait for 100 ns; -- SLT

        data1 <= x"0000000E"; -- = 14
        data2 <= x"0000000A"; -- = 10
        aluop <= "0111"; wait for 100 ns; -- 14 < 10

        data1 <= x"0000000A"; -- = 10
        data2 <= x"0000000A"; -- = 10
        aluop <= "0110"; wait for 100 ns; -- 10 - 10

        data1 <= x"FFFFFFFF"; -- = -1
        data2 <= x"00000000"; -- = 0
        aluop <= "1100"; wait for 100 ns; 

        wait;
    end process;
end behavior;