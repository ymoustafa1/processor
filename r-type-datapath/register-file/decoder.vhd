library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity decoder is
    port (
        write_sel : in STD_LOGIC_VECTOR ( 4 downto 0 );
        sel : out STD_LOGIC_VECTOR (31 downto 0)    
    );
end entity;

architecture behaviour of decoder is
signal temp :STD_LOGIC_VECTOR(31 downto 0);
signal shift_amount : INTEGER range 0 to 31 ;

begin
 temp <= x"00000001";
 shift_amount <= to_integer(unsigned(write_sel));
 sel<= STD_LOGIC_VECTOR(SHIFT_LEFT(unsigned(temp) , shift_amount)); 
end architecture;