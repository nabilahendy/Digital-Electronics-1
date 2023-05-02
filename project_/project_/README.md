# MORSE CODE TRANSMITTER/RECEIVER


### Team members

* Jesús Santos ID:250930 (responsible for VHDL code and theorical description of the project)
* Nabila Hendy ID:251490 (responsible for VHDL code and theorical description of the project)

### Table of contents 

* [Theoretical approach]
* [Goals]
* [Hardware description]
* [VHDL description]
* [References]


## Theoretical approach

The project consist on a Morse code decoder that takes a string of up to three characters, translates it into Morse code, and displays the code on a seven-segment LED display. The project is designed to be implemented on the Nexys A7-50T FPGA board.

The input to the decoder is a clock signal and a reset signal. The clock signal is used to synchronize the various processes in the design, while the reset signal is used to initialize the design to a known state. The output of the decoder is a seven-segment LED display that shows the Morse code representation of the input string.

The design consists of several processes. The first process is a clock generator that generates a 100 MHz clock signal. The second process is a reset generator that generates a reset signal when the reset input goes low. The third process is a Morse code decoder that takes the input string and translates it into Morse code. The fourth process is a LED display driver that displays the Morse code on the seven-segment LED display.

The Morse code decoder is implemented using a lookup table that maps each character of the alphabet to its Morse code representation. The decoder reads the input string character by character and looks up the corresponding Morse code in the table. It then displays the Morse code on the LED display using a combination of the seven-segment display segments.

Overall, this project is an example of how to implement a digital system using VHDL. It combines hardware description with programming to create a system that can take input, process it, and produce an output. It also demonstrates the use of lookup tables for efficient decoding and the use of timing constraints to ensure proper operation of the system.

## Goals of the work

Based on the provided VHDL code, it seems like the goal of this project is to implement a Morse code decoder on a hardware device, which can receive a Morse code message and decode it to display the corresponding text message.

The project appears to involve generating a 100 MHz clock signal and a reset signal, which will be used to synchronize the different components of the system. The main functionality of the project is implemented in the p_morse_decoder process, which decodes a Morse code message (represented as a string of dots, dashes, and spaces) and displays the corresponding text message on a 7-segment display.

The project likely aims to demonstrate how a simple communication protocol like Morse code can be implemented in hardware using VHDL, and how different components of the system can be synchronized using clock signals and reset signals. Additionally, the project could also serve as a basic introduction to digital signal processing, sequential logic, and finite state machines.
Using ASCII code 

## Hardware description

The Nexys A7-50T is a development board designed by Digilent, which is based on the Xilinx Artix-7 FPGA (Field-Programmable Gate Array). It is intended for use in designing and testing digital circuits and systems.

Here are some of the hardware features of the Nexys A7-50T board:

FPGA: The board is built around the Xilinx Artix-7 FPGA (XC7A50T-1CSG324C), which is a mid-range FPGA that offers a good balance of performance, power consumption, and cost.

Memory: The board has 256 MB DDR3 SDRAM, 16 MB quad-SPI Flash memory, and 4 KB EEPROM.

Digital I/O: The board has a variety of digital I/O options, including 16 switches, 16 LEDs, 7-segment displays, 4-digit 7-segment display, VGA and HDMI ports, 4 Pmod connectors, and a USB-UART bridge.

Analog I/O: The board also includes several analog I/O options, including a 4-channel 12-bit 1 MSPS ADC (Analog-to-Digital Converter), a 2-channel 12-bit 1 MSPS DAC (Digital-to-Analog Converter), and a 4-channel 0-10 V analog input section.

Power: The board is powered by a 5 V DC power supply and includes a voltage regulator to generate the required voltages for the FPGA and other components.

Connectivity: The board has a micro USB port for programming and communication with a PC, as well as Ethernet, Wi-Fi, and Bluetooth connectivity.

Overall, the Nexys A7-50T is a versatile and capable development board that can be used for a wide range of digital circuit and system design projects.

## VHDL description


This VHDL code is for implementing a Morse code decoder using an FPGA or similar digital hardware. Morse code is a communication system that uses a series of dots and dashes to represent letters, numbers, and symbols. In this design, the input signal is a clock and reset signal. The output signals are three-bit vectors for the left and right LEDs, which represent the decoded Morse code.

The ENTITY "morse" defines the inputs and outputs of the design, which are clk, reset, rled and lled. The "clk" signal is a clock input to the design, "reset" signal is used to reset the design to its initial state, and "rled" and "lled" are output signals that control the right and left LEDs, respectively.

The ARCHITECTURE "behavior" defines the behavior of the design. The CONSTANT "c_CLK_PERIOD" specifies the period of the clock signal. The SIGNALs "s_clk_100MHz" and "s_reset" are used to generate the clock and reset signals. The SIGNAL "s_clk_counter" is used to count the number of clock cycles. The SIGNAL "s_morse_code" is a string that stores the Morse code message to be decoded. The SIGNAL "s_morse_index" is used to keep track of the current index in the Morse code message. The SIGNAL "s_data" is a six-bit vector used to drive the seven-segment display. The SIGNAL "s_seg" is a seven-bit vector used to select the segments of the seven-segment display. The SIGNAL "s_dig" is an eight-bit vector used to select the digit of the seven-segment display. The SIGNAL "s_start" is used to indicate the start of a new Morse code message. The SIGNALs "s_rled" and "s_lled" are three-bit vectors that control the right and left LEDs.

The TYPE "morse_code_table" is an array of STD_LOGIC_VECTORs that maps each uppercase letter to its corresponding Morse code. The CONSTANT "c_morse_code_table" is initialized with the Morse code for each letter.

The PROCESS "p_clk_gen" generates the clock signal with a period of c_CLK_PERIOD. The PROCESS "p_reset_gen" generates the reset signal, which is set to '1' when the "reset" input is asserted and held for 10 ns before being set to '0'.

The PROCESS "p_morse_decoder" is the heart of the design. It decodes the Morse code message by selecting the appropriate segment of the seven-segment display based on the current index in the Morse code message. It also sets the "s_start" signal to '1' at the end of the message to indicate that a new message can be decoded.

The PROCESS "p_led" is used to control the right and left LEDs. It uses the "s_clk_counter" signal to generate a sequence of three-bit vectors for the right and left LEDs, which represent the decoded Morse code.

The code appears to be incomplete as the PROCESS "p_led" is not fully defined. Additionally, there is no assignment to the output signals rled and lled.

However, whe have had problems compiling the code, because we want to read the 4 bits of each alphabet's character, but we can because we have to implement a padding algorithm to ignore it and read each letter's coding, but we didn't know how to do it


## References
Notes from labs and course.
https://en.wikipedia.org/wiki/Morse_code#:~:text=Morse%20code%20is%20a%20method,the%20inventors%20of%20the%20telegraph.
http://denethor.wlu.ca/pc300/pc319projects/morse/morsecode.htm
https://www.youtube.com/watch?v=fLwfeRlaXrg&ab_channel=G%C3%B6khan
