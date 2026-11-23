library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_decoder is
end entity;

architecture behaviour of tb_decoder is
signal write_sel: STD_LOGIC_VECTOR ( 4 downto 0 );
signal sel : STD_LOGIC_VECTOR (31 downto 0) ;  

begin
uut : entity work.decoder port map(write_sel => write_sel,sel => sel);
stim_proc :  process 
begin

    write_sel<="00001"; wait for 100 ns;
    write_sel<="00000"; wait for 100 ns ;
    write_sel<="00010"; wait for 100 ns ;
    wait;
end process;

end architecture;