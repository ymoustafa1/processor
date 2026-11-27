library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Datapath is
end tb_Datapath;

architecture Behavioral of tb_Datapath is

    signal clk, reset, regwrite : std_logic := '0';
    signal instr : std_logic_vector(31 downto 0) := (others => '0');
    signal aluoperation : std_logic_vector(3 downto 0) := (others => '0');
    signal zero : std_logic;
    signal aluout : std_logic_vector(31 downto 0);
begin

    uut_Datapath : entity work.Datapath
        port map (
            clk => clk,
            reset => reset,
            regwrite => regwrite,
            instr => instr,
            aluoperation => aluoperation,
            zero => zero,
            aluout => aluout
        );

    clk_process : process
begin
    for i in 1 to 20 loop
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end loop;
    wait;
end process;

    stim_proc : process
begin

    reset <= '0';
    regwrite <= '1';

    wait until falling_edge(clk);

    instr <= "000000" & "00000" & "00000" &
             "01000" & "00000" & "100111";
    aluoperation <= "1100";

    wait for 10 ns;

    assert aluout = x"FFFFFFFF"
        report "NOR failed" severity failure;

    assert zero = '0'
        report "NOR zero flag failed" severity failure;

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    instr <= "000000" & "00000" & "01000" &
             "01001" & "00000" & "100010";
    aluoperation <= "0110";

    wait for 10 ns;

    assert aluout = x"00000001"
        report "SUB failed" severity failure;

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    instr <= "000000" & "01001" & "01001" &
             "01010" & "00000" & "100000";
    aluoperation <= "0010";

    wait for 10 ns;

    assert aluout = x"00000002"
        report "ADD failed" severity failure;

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    instr <= "000000" & "01001" & "01010" &
             "01011" & "00000" & "100100";
    aluoperation <= "0000";

    wait for 10 ns;

    assert aluout = x"00000000"
        report "AND failed" severity failure;

    assert zero = '1'
        report "Zero flag failed" severity failure;

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    instr <= "000000" & "01001" & "01010" &
             "01100" & "00000" & "100101";
    aluoperation <= "0001";

    wait for 10 ns;

    assert aluout = x"00000003"
        report "OR failed" severity failure;

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    instr <= "000000" & "01001" & "01010" &
             "01101" & "00000" & "101010";
    aluoperation <= "0111";

    wait for 10 ns;

    assert aluout = x"00000001"
        report "SLT failed" severity failure;

    wait until rising_edge(clk);


  
    wait until falling_edge(clk);

    regwrite <= '0';

    instr <= "000000" & "00000" & "00000" &
             "01100" & "00000" & "100000";
    aluoperation <= "0010";

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    instr <= "000000" & "01100" & "00000" &
             "00000" & "00000" & "100101";
    aluoperation <= "0001";

    wait for 10 ns;

    assert aluout = x"00000003"
        report "Write enable failed" severity failure;


    wait until falling_edge(clk);

    regwrite <= '1';
    reset <= '1';

    instr <= "000000" & "00000" & "00000" &
             "01100" & "00000" & "100000";
    aluoperation <= "0010";

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    reset <= '0';
    regwrite <= '0';

    instr <= "000000" & "01100" & "00000" &
             "00000" & "00000" & "100101";
    aluoperation <= "0001";

    wait for 10 ns;

    assert aluout = x"00000003"
        report "Reset test failed" severity failure;


    wait until falling_edge(clk);

    regwrite <= '1';

    instr <= "000000" & "00000" & "00000" &
             "00000" & "00000" & "100111";
    aluoperation <= "1100";

    wait until rising_edge(clk);


    wait until falling_edge(clk);

    regwrite <= '0';

    instr <= (others => '0');
    aluoperation <= "0010";

    wait for 10 ns;

    assert aluout = x"00000000"
        report "Register zero protection failed"
        severity failure;


    report "ALL DATAPATH TESTS PASSED" severity note;

    wait;

end process;

end Behavioral;