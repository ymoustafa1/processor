library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_RTypeFields is
end tb_RTypeFields;

architecture Behavioral of tb_RTypeFields is

    signal instr : STD_LOGIC_VECTOR(31 downto 0)
                   := (others => '0');

    signal regwrite : STD_LOGIC := '0';
    
    signal reset : STD_LOGIC := '0';

    signal read_sel1 : STD_LOGIC_VECTOR(4 downto 0);
    signal read_sel2 : STD_LOGIC_VECTOR(4 downto 0);
    signal write_sel : STD_LOGIC_VECTOR(4 downto 0);   
    signal write_ena : STD_LOGIC;
    signal test_done : STD_LOGIC := '0';
 

begin

    uut : entity work.RTypeFields
    port map (
        instr => instr,
        regwrite => regwrite,
        reset => reset,
        read_sel1 => read_sel1, 
        read_sel2 => read_sel2,
        write_sel => write_sel,
      write_ena => write_ena
    );

stimulus : process
begin
    -- test case 1
    regwrite <= '0';
    reset <= '0';
    wait for 10 ns;
    assert write_ena = '0'
    report "Test case 1 failed"
    severity failure;

    -- test case 2
    regwrite <= '0';
    reset <= '1';
    wait for 10 ns;
    assert write_ena = '0'
    report "Test case 2 failed"
    severity failure;

        -- test case 3
    regwrite <= '1';
    reset <= '0';
    wait for 10 ns;
    assert write_ena = '1'
    report "Test case 3 failed"
    severity failure;

        -- test case 4
    regwrite <= '1';
    reset <= '1';
    wait for 10 ns;
    assert write_ena = '0'
    report "Test case 4 failed"
    severity failure;

    --test 5
instr <= "000000" & "01001" & "01010" &
         "01000" & "00000" & "100000";

regwrite <= '1';
reset <= '0';

wait for 10 ns;

assert read_sel1 = "01001"
    report "Wrong rs address"
    severity failure;
    
    assert read_sel2 = "01010"
    report "Test 5: Wrong rt address"
    severity failure;
    
    assert write_sel = "01000"
    report "Test 5: Wrong rd address"
    severity failure;
    
    assert write_ena = '1'
    report "Test 5: Wrong write enable"
    severity failure;

    -- test 6
instr <= "000000" & "10001" & "10010" &
         "10000" & "00000" & "100010";

regwrite <= '1';
reset <= '0';

wait for 10 ns;

assert read_sel1 = "10001"
    report "Test 6: Wrong rs address"
    severity failure;

assert read_sel2 = "10010"
    report "Test 6: Wrong rt address"
    severity failure;

assert write_sel = "10000"
    report "Test 6: Wrong rd address"
    severity failure;

assert write_ena = '1'
    report "Test 6: Wrong write enable"
    severity failure;
    

    --test 7
instr <= "000000" & "00000" & "11111" &
         "01000" & "00000" & "100100";

regwrite <= '1';
reset <= '0';

wait for 10 ns;

assert read_sel1 = "00000"
    report "Test 7: Wrong rs address"
    severity failure;

assert read_sel2 = "11111"
    report "Test 7: Wrong rt address"
    severity failure;

assert write_sel = "01000"
    report "Test 7: Wrong rd address"
    severity failure;

assert write_ena = '1'
    report "Test 7: Wrong write enable"
    severity failure;

report "All test cases passed" severity note;

test_done <= '1';

wait;
end process;
end Behavioral;