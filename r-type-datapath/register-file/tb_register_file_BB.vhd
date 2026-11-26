library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.RF_Package.all;

entity tb_register_file_BB is 
end entity;

architecture behaviour of tb_register_file_BB is
signal write_ena :  std_logic;
signal write_sel : std_logic_vector (4 downto 0);
signal write_data :  std_logic_vector(31 downto 0);
signal read_sel1 :  std_logic_vector (4 downto 0);
signal read_sel2 :  std_logic_vector (4 downto 0);
signal clk :  std_logic;
signal  data1:  std_logic_vector ( 31 downto 0);
signal data2 :  std_logic_vector ( 31 downto 0);
constant clk_period : time:=100 ns;

begin
uut : entity work.register_file_BB port map (write_data => write_data, write_ena => write_ena,write_sel => write_sel,data1 => data1,data2=>data2 , read_sel1 => read_sel1,read_sel2 => read_sel2,clk => clk);

clk_process : process 
begin
    for i in 1 to 10 loop     
        clk <= '0'; wait for clk_period/2;
        clk <= '1'; wait for clk_period/2;
    end loop;
    wait; 
end process;

stim_proc : process
begin
    write_ena  <= '0';
    write_sel  <= "00000";
    write_data <= x"00000000";
    read_sel1  <= "00000";
    read_sel2  <= "00000";
    wait for clk_period/2;

    write_ena  <= '1';
    write_sel  <= "00001";
    write_data <= x"000000FF";
    read_sel1  <= "00001";
    read_sel2  <= "00001";
    wait for clk_period-10 ns;

        write_sel  <= "00010";
    wait for 10 ns;
    write_ena  <= '1';
    write_data <= x"AABBCCDD";
    read_sel1  <= "00001";
    read_sel2  <= "00010";
    wait for clk_period- 10 ns;

        write_sel  <= "00001";
        write_ena  <= '0';
wait for 10 ns;
    write_data <= x"12345678";
    read_sel1  <= "00001";
    wait for clk_period - 10 ns;

    write_sel  <= "00000";
wait for 10 ns;
    write_ena  <= '1';
    write_data <= x"00000001";
    wait for clk_period -10 ns;

    write_sel  <= "11111";
wait for 10 ns ;

    write_data <= x"80000000";
    read_sel1  <= "00000";
    read_sel2  <= "11111";
    wait for clk_period;

    write_ena <= '0';
    wait;
end process;
    

end architecture;

