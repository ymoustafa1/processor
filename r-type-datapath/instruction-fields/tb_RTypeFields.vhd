library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbenches have no external ports.
entity tb_RTypeFields is
end tb_RTypeFields;

architecture Simulation of tb_RTypeFields is
    signal instr     : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal regwrite  : STD_LOGIC := '0';
    signal reset     : STD_LOGIC := '0';
    signal read_sel1 : STD_LOGIC_VECTOR(4 downto 0);
    signal read_sel2 : STD_LOGIC_VECTOR(4 downto 0);
    signal write_sel : STD_LOGIC_VECTOR(4 downto 0);
    signal write_ena : STD_LOGIC;
begin
    -- Connect the actual design to the testbench signals.
    uut : entity work.RTypeFields
        port map (
            instr     => instr,
            regwrite  => regwrite,
            reset     => reset,
            read_sel1 => read_sel1,
            read_sel2 => read_sel2,
            write_sel => write_sel,
            write_ena => write_ena
        );

    stimulus : process
    begin
        -- R-type ADD $t0, $t1, $t2: rs=9, rt=10, rd=8.
        instr <= "000000" & "01001" & "01010" & "01000" & "00000" & "100000";
        regwrite <= '0';
        reset <= '0';
        wait for 10 ns;
        assert read_sel1 = "01001" report "ADD: wrong rs" severity failure;
        assert read_sel2 = "01010" report "ADD: wrong rt" severity failure;
        assert write_sel = "01000" report "ADD: wrong rd" severity failure;
        assert write_ena = '0' report "regwrite=0 reset=0: wrong write_ena" severity failure;

        -- All four regwrite/reset combinations.
        regwrite <= '0'; reset <= '1';
        wait for 10 ns;
        assert write_ena = '0' report "regwrite=0 reset=1: wrong write_ena" severity failure;

        regwrite <= '1'; reset <= '0';
        wait for 10 ns;
        assert write_ena = '1' report "regwrite=1 reset=0: wrong write_ena" severity failure;

        regwrite <= '1'; reset <= '1';
        wait for 10 ns;
        assert write_ena = '0' report "regwrite=1 reset=1: wrong write_ena" severity failure;
        assert read_sel1 = "01001" report "reset incorrectly changed rs" severity failure;

        -- Different register numbers: SUB $s4, $s1, $a1 (rs=17, rt=5, rd=20).
        instr <= "000000" & "10001" & "00101" & "10100" & "00000" & "100010";
        regwrite <= '1'; reset <= '0';
        wait for 10 ns;
        assert read_sel1 = "10001" report "SUB: wrong rs" severity failure;
        assert read_sel2 = "00101" report "SUB: wrong rt" severity failure;
        assert write_sel = "10100" report "SUB: wrong rd" severity failure;
        assert write_ena = '1' report "SUB: wrong write_ena" severity failure;

        -- Boundary register addresses: rs=31, rt=0, rd=31.
        instr <= "000000" & "11111" & "00000" & "11111" & "00000" & "100100";
        wait for 10 ns;
        assert read_sel1 = "11111" report "boundary: wrong rs" severity failure;
        assert read_sel2 = "00000" report "boundary: wrong rt" severity failure;
        assert write_sel = "11111" report "boundary: wrong rd" severity failure;

        report "PASS: all RTypeFields checks completed" severity note;
        wait;
    end process;
end Simulation;
