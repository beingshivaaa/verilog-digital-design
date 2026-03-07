# SR Flip-Flop (Verilog)

DESCRIPTION:

This project implements a **clocked SR (Set-Reset) Flip-Flop** using Verilog.
The flip-flop stores a single bit of data and changes its output based on the values of the Set(S) and Reset(R) inputs on the rising edge of the clock.

An active-low asynchronous reset (rst_n) is also included. When rst_n = 0, the flip-flop is immediately cleared and the output 'Q' becomes '0'.

OPERATION:

The SR flip-flop behaves according to the following input combinations:

| S | R | Operation           | Q(next) |
| - | - | ------------------- | ------- |
| 0 | 0 | Hold previous state | Q       |
| 0 | 1 | Reset               | 0       |
| 1 | 0 | Set                 | 1       |
| 1 | 1 | Invalid state       | X       |

FILES:

* sr_ff.v – Verilog implementation of the SR flip-flop
* sr_ff_tb.v – Testbench used to verify the functionality
* waveform.jpeg – Simulation waveform showing the behavior of the circuit

SIMULATION:

The design was simulated using:

* Icarus Verilog for compilation and simulation
* GTKWave for viewing the waveform
* Visual Studio Code as the development environment

APPLICATIONS:

SR flip-flops are commonly used in digital systems such as:

* Memory elements
* Control circuits
* Sequential logic design
* Registers and state machines
