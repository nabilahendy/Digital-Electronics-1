# Lab 5: Nabila Hendy

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

![image](https://user-images.githubusercontent.com/115028247/224490717-a2e16c3c-8ef4-4a1d-bca8-8687aea4fe74.png)


### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl

library ieee;
use ieee.std_logic_1164.all;


entity jk_ff_rst is
port (
    clk : in std_logic;
    rst : in std_logic;
    j: in std_logic;
    k: in std_logic;
    q : out std_logic;
    q_bar : out std_logic
);
end entity jk_ff_rst;

architecture Behavioral of jk_ff_rst is
      
      
      signal sig_q : std_logic;
begin
    -- WRITE YOUR CODE HERE
    process (clk)
      
     if (clk = '1') then
         if (j = '0' and k = '0') then
               sig_q = sig_q;
            elsif (j = '1' and k = '1') then
               sig_q = not sig_q;
            elsif (j = '0' k = '1') then
               sig_q = '1';
         else
            sig_q = '0';
         end if;
     end if;
   
    -- Output ports are permanently connected to local signal
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture Behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

 ![image](https://user-images.githubusercontent.com/115028247/224491806-67a3a9eb-bb10-4c26-aba6-6646574e492a.png)

