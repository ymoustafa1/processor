library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity D_Register_32  is 
    port(
        C: in std_logic; 
        D : in std_logic_vector (31 downto 0);
        Q : out  std_logic_vector (31 downto 0)
    );
end D_Register_32;

architecture behaviour of D_Register_32 is

begin
    process(C)
    begin
        if C'event and C ='1'  then 
            Q<=D; 
        end if;
    end process;
end behaviour ; 