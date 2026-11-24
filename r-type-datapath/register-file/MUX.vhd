library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.RF_Package.all;

entity MUX is
    port(
        read_sel : in STD_LOGIC_VECTOR (4 downto 0);
        inputs : in mux_input_array;
        data : out STD_LOGIC_VECTOR (31 downto 0 )
    );
end entity;

architecture behaviour of MUX is
signal temp : integer range 0 to 31; 
begin
    temp<= to_integer(unsigned(read_sel));
    data<= inputs(temp);
end architecture;