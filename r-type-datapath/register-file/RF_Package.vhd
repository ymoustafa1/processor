library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


package RF_Package is

    type mux_input_array is array (natural range<>) of std_logic_vector(31 downto 0);
    
    component  D_Register_32 is
        generic(n: Natural :=32);
        port(
            C: in std_logic; 
            D : in std_logic_vector (n-1 downto 0);
            Q : out  std_logic_vector (n-1 downto 0)
        );
        end component;

    component decoder is 
            port(
                write_sel : in STD_LOGIC_VECTOR ( 4 downto 0 );
                sel : out STD_LOGIC_VECTOR (31 downto 0) 
            );
    end component;
end package;