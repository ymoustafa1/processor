library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.RF_Package.all;

entity register_file_BB is 
    port(
        write_ena : in std_logic;
        write_sel : in std_logic_vector (4 downto 0);
        write_data : in std_logic_vector(31 downto 0);
        read_sel1 : in std_logic_vector (4 downto 0);
        read_sel2 : in std_logic_vector (4 downto 0);
        clk : in std_logic;
        data1: out std_logic_vector ( 31 downto 0);
        data2 : out std_logic_vector ( 31 downto 0)
    );
    end entity;

architecture behaviour of register_file_BB is
signal mux1_inputs :mux_input_array;
signal mux2_inputs : mux_input_array;
signal dec_sel : std_logic_vector(31 downto 0);
signal reg_outputs  : mux_input_array;


begin
    decoderA : decoder
    port map(
       write_sel => write_sel,
       write_ena => write_ena,
       sel=>dec_sel
   );

gen_registers : for i in 0 to 31 generate
   registers : D_Register_32
    port map(
       C => (clk and dec_sel(i)),
       D => write_data,
       Q => reg_outputs(i)
   );
   mux1_inputs(i) <= reg_outputs(i);
   mux2_inputs(i) <= reg_outputs(i);
end generate gen_registers;

   mux1 : MUX 
   port map (
    read_sel => read_sel1,
    inputs => mux1_inputs,
    data => data1
   );
   mux2 : MUX 
   port map (
    read_sel => read_sel2,
    inputs => mux2_inputs,
    data => data2
   );
    

end architecture;