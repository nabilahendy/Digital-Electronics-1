----------------------------------------------------------------------------------
-- Engineer: Nabila Hendy y Jesus Santos
-- Create Date: 04/26/2023 09:30:51 AM
-- Design Name: Project Digital Electronics
-- Module Name: morse - Behavioral
-- Project Name: 
-- Target Devices: Nexys A7-50T

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse is
    Port (
        clk: in std_logic;
        reset: in std_logic;
        led: out std_logic
 );
end morse;

architecture Behavioral of morse is
    
        CONSTANT c_clk_period: TIME := 10ns; 
    
        SIGNAL s_clk_100MHz : std_logic;
        SIGNAL s_reset      : std_logic;
           
        SIGNAL s_clk_counter : INTEGER RANGE 0 TO 25000000 := 0;
        SIGNAL s_morse_code  : STRING(1 TO 3) := "SOS";
        SIGNAL s_morse_index : INTEGER RANGE 1 TO 3 := 1;
        SIGNAL s_data     : STD_LOGIC_VECTOR(5 DOWNTO 0);
        
        SIGNAL s_seg        : std_logic_vector(6 DOWNTO 0);
        SIGNAL s_dig        : std_logic_vector(7 DOWNTO 0);
        SIGNAL s_start      : std_logic;
        SIGNAL s_led       : std_logic_vector(2 DOWNTO 0);
        --SIGNAL s_lled       : std_logic_vector(2 DOWNTO 0);
        
        TYPE morse_code_table IS ARRAY(CHARACTER RANGE 'A' TO 'Z') OF STD_LOGIC_VECTOR(2 DOWNTO 0);
        CONSTANT c_morse_code_table : morse_code_table := (
        'A' => "010",
        'B' => "1000",
        'C' => "1010",
        'D' => "100",
        'E' => "0",
        'F' => "0010",
        'G' => "110",
        'H' => "0000",
        'I' => "00",
        'J' => "0111",
        'K' => "101",
        'L' => "0100",
        'M' => "11",
        'N' => "10",
        'O' => "111",
        'P' => "0110",
        'Q' => "1101",
        'R' => "010",
        'S' => "000",
        'T' => "1",
        'U' => "001",
        'V' => "0001",
        'W' => "011",
        'X' => "1001",
        'Y' => "1011",
        'Z' => "1100"
 );
    
begin
    
       p_clk_gen: process
        begin
            while TRUE loop
                s_clk_100MHz <= '1';
                wait for c_CLK_PERIOD / 2;
                s_clk_100MHz <= '0';
                wait for c_CLK_PERIOD / 2;
            end loop;
         end process p_clk_gen;
    
        p_reset_gen: process
          begin 
                wait until reset = '0';
                s_reset <= '1';
                wait for 10 ns;
                s_reset <= '0';
                wait;
           end process p_reset_gen;
            
        p_led_gen: process
           begin
                s_data <= "010100"; --s
                wait for 200 ns;
                s_data <= "111000"; --o
                wait for 200 ns;
                s_data <= "010100"; --s
                wait for 200 ns;
                
                s_data <= "000000"; -- space between words
                
                 s_data <= "010100"; --s
                wait for 200 ns;
                s_data <= "111000"; --o
                wait for 200 ns;
                s_data <= "010100"; --s
                wait for 200 ns;
              wait;   
           end process p_led_gen;
end Behavioral;
