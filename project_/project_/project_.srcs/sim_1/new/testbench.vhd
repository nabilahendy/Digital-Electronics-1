library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    
    COMPONENT morse
        PORT(
            clk   : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            led   : OUT STD_LOGIC
        );
    END COMPONENT;
    
    SIGNAL s_clk       : STD_LOGIC := '0';
    SIGNAL s_reset     : STD_LOGIC := '1';
    SIGNAL s_led       : STD_LOGIC;
    
BEGIN
    
    uut: morse PORT MAP (
        clk   => s_clk,
        reset => s_reset,
        led   => s_led
    );
    
    process
    begin
        s_reset <= '1';
        wait for 20 ns;
        s_reset <= '0';
        wait for 10 ns;
        while true loop
            s_clk <= not s_clk;
            wait for 5 ns;
        end loop;
    end process;
    
END Behavioral;