library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Extract register addresses and generate the active-high write enable.
entity RTypeFields is
    port (
        instr     : in  STD_LOGIC_VECTOR(31 downto 0);
        regwrite  : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        read_sel1 : out STD_LOGIC_VECTOR(4 downto 0);
        read_sel2 : out STD_LOGIC_VECTOR(4 downto 0);
        write_sel : out STD_LOGIC_VECTOR(4 downto 0);
        write_ena : out STD_LOGIC
    );
end RTypeFields;

architecture Behavioral of RTypeFields is
begin
    -- Addresses of the two source registers and the destination register.
    read_sel1 <= instr(25 downto 21);  -- rs
    read_sel2 <= instr(20 downto 16);  -- rt
    write_sel <= instr(15 downto 11);  -- rd

    -- The active-high reset prevents writing; it does not clear registers.
    write_ena <= regwrite and (not reset);
end Behavioral;
