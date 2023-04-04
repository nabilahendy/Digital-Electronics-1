# Lab 8: Nabila Hendy

### Traffic light controller

1. Listing of VHDL code of the completed process `p_traffic_fsm`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_traffic_fsm:
    -- A sequential process with synchronous reset and
    -- clock_enable entirely controls the s_state signal by
    -- CASE statement.
    --------------------------------------------------------
    p_traffic_fsm : process(clk) is
    begin
        if (rising_edge(clk)) then

            -- WRITE YOR CODE HERE
            
            if (rst = '1') then // synchronous reset
              sig state <= WEST_STOP; // initial state
              sig_cnt <= c_ZERO; // clear delay counter
              
            elseif (sig_en = '1') then
            
              case sig_state is
              
                when WEST_STOP =>
                  
                  if (sig_cnt < c_DELAY_2SEC) then //count to 2 seconds
                    sig_cnt <= sig_cnt +1;
                  else
                    sig_state <= WEST_GO; // move to the next state
                    sig_cnt <= c_ZERO; // rst local counter value
                  end if;
                  
                 when WEST_GO =>
                  
                  if (sig_cnt < c_DELAY_4SEC) then
                    sig_cnt <= sig_cnt +1;
                  else
                    sig_state <= WEST_WAIT;
                    sig_cnt <= c_ZERO;
                  end if; 
                  
                when WEST_WAIT =>
                  
                  if (sig_cnt < c_DELAY_1SEC) then
                    sig_cnt <= sig_cnt +1;
                  else
                    sig_state <= SOUTH_STOP;
                    sig_cnt <= c_ZERO;
                  end if;
                
                when SOUTH_STOP =>
                  
                  if (sig_cnt < c_DELAY_2SEC) then
                    sig_cnt <= sig_cnt +1;
                  else
                    sig_state <= SOUTH_GO;
                    sig_cnt <= c_ZERO;
                  end if;
                
                when SOUTH_GO =>
                  
                  if (sig_cnt < c_DELAY_4SEC) then
                    sig_cnt <= sig_cnt +1;
                  else
                    sig_state <= SOUTH_WAIT;
                    sig_cnt <= c_ZERO;
                  end if;
                  
                when others =>
                
                  if (sig_cnt < c_DELAY_1SEC) then
                    sig_cnt <= sig_cnt + 1;
                  else
                    sig_state <= WEST_STOP;
                    sig_cnt <= c_ZERO;
                  end if;
             end case;
          end if
        end if; -- Rising edge
    end process p_traffic_fsm;
```

2. Screenshot with simulated time waveforms. The full functionality of the entity must be verified. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

![Captura de pantalla (281)](https://user-images.githubusercontent.com/115028247/229863077-3fcd93bf-ae72-406d-8912-c2531c5b8322.png)

   
3. Figure of Moor-based state diagram of the traffic light controller with *speed button* to ensure a synchronous transition to the `WEST_GO` state. The image can be drawn on a computer or by hand. Always name all states, transitions, and input signals!

   ![image](https://user-images.githubusercontent.com/115028247/229864588-fc605483-21c5-4ee4-a011-841e034c8e5d.png)

