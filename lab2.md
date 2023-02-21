# Digital-Electronics-1
# Lab 2: Nabila Hendy

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

Based in the next table:

![Captura de pantalla (261)](https://user-images.githubusercontent.com/115028247/220341241-afcf82e6-acba-4b76-ac24-761e6f617c45.png)



   Greater than:

   ![image](https://user-images.githubusercontent.com/115028247/220420953-9e5eb42d-f9f4-4756-8c61-a5e6130e62da.png)


   Less than:

   ![image](https://user-images.githubusercontent.com/115028247/220421003-ed68374a-2a42-4fbb-9838-22c379bc61b2.png)


2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![image](https://user-images.githubusercontent.com/115028247/220421050-8089032d-6c32-4c00-8931-2ac421029ebd.png)


### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **251490**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case (a = 9; b=0)
        s_b <= "0000"; -- Such as "0101" if ID = xxxx56
        s_a <= "1001";        -- Such as "0110" if ID = xxxx56
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        report "Input combination COMPLETE_THIS_TEXT FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

  https://www.edaplayground.com/x/U_hZ
