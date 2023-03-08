library ieee;
use ieee.std_logic_1164.all;


entity t_ff_rst is
port (
    clk : in std_logic;
    rst : in std_logic;
    t : in std_logic;
    q : out std_logic;
    q_bar : out std_logic
);
end entity t_ff_rst; 

architecture behavioral of t_ff_rst is
    -- It must use this local signal instead of output ports
    -- because "out" ports cannot be read within the architecture
    signal sig_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active synchro reset and
    -- rising-edge clk.
    -- sig_q = t./sig_q + /t.sig_q
    -- sig_q =  sig_q if t = 0 (no change)
    -- sig_q = /sig_q if t = 1 (inversion)
    --------------------------------------------------------
    p_t_ff_rst : process (clk)
    begin

        -- WRITE YOUR CODE HERE
        if rising_edge(clk) then
            if (rst = '1') then
                sig_q <= '0';
            elsif (t  =  '0') then
                sig_q<= sig_q;
                
            else
                sig_q <= not sig_q;
            
            end if;
        end if;
    
end process p_t_ff_rst;
   q     <= sig_q;
    q_bar <= not sig_q;
end architecture behavioral;


