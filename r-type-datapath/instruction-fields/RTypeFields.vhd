library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RTypeFields is
    port (
        instr    : in STD_LOGIC_VECTOR(31 downto 0);
        regwrite : in STD_LOGIC;

        reset    : in STD_LOGIC;

        read_sel1 : out STD_LOGIC_VECTOR(4 downto 0); --rs
        read_sel2 : out STD_LOGIC_VECTOR(4 downto 0); --rt

        write_sel : out STD_LOGIC_VECTOR(4 downto 0); --rd

        write_ena : out STD_LOGIC
    );
end RTypeFields;

architecture Behavioral of RTypeFields is
begin
    read_sel1 <= instr(25 downto 21);
    read_sel2 <= instr(20 downto 16);
    write_sel <= instr(15 downto 11);

    write_ena <= regwrite and not reset;
end Behavioral;