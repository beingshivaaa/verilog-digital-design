# D Flip-Flop (Verilog Implementation)

DESCRIPTION:

This project implements a **positive edge-triggered D Flip-Flop with an active-low reset** using Verilog.
The flip-flop stores the value of input 'D' on every rising edge of the clock and holds that value at the output 'Q' until the next clock cycle.

An **active-low reset (rst_n)** is used in the design. When the reset signal becomes '0', the output is immediately cleared to '0' regardless of the clock signal.

FILES:

* d_flipflop.v – Verilog module for the D Flip-Flop
* d_flipflop_tb.v – Testbench used to verify the design
* waveform.jpeg – Simulation waveform showing the behavior of the circuit

SIMULATION:

The design was simulated using **Icarus Verilog** and the waveform was viewed in **GTKWave**.
The simulation confirms that the output 'Q' updates only on the rising edge of the clock and resets correctly when 'rst_n = 0'.

APPLICATIONS:
D Flip-Flops are commonly used in digital systems such as registers, counters, and pipeline stages in processors.
