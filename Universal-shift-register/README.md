# Universal Shift Register (4-bit) – Verilog Implementation

## Overview

This project implements a **4-bit Universal Shift Register** in Verilog HDL along with its operational description.
A Universal Shift Register is a sequential circuit capable of performing multiple data operations such as **shift left, shift right, parallel load, and hold** depending on control inputs.

Such registers are widely used in **digital systems, processors, communication interfaces, and data storage applications**.

---

# Features

The implemented Universal Shift Register supports the following operations:

* Hold (No operation)
* Shift Right
* Shift Left
* Parallel Load
* Asynchronous Reset (Active Low)

---

# Module Interface

### Inputs

| Signal        | Width | Description                          |
| ------------- | ----- | ------------------------------------ |
| `clk`         | 1     | Clock input                          |
| `rst_n`       | 1     | Active-low reset signal              |
| `select`      | 2     | Operation selection control          |
| `p_din`       | 4     | Parallel data input                  |
| `s_left_din`  | 1     | Serial data input during left shift  |
| `s_right_din` | 1     | Serial data input during right shift |

### Outputs

| Signal         | Width | Description                              |
| -------------- | ----- | ---------------------------------------- |
| `p_dout`       | 4     | Parallel data output (register contents) |
| `s_left_dout`  | 1     | Serial output during left shift          |
| `s_right_dout` | 1     | Serial output during right shift         |

---

# Operation Control

The operation performed by the register depends on the value of the `select` signal.

| Select | Operation     | Description                                  |
| ------ | ------------- | -------------------------------------------- |
| `00`   | Hold          | Retains previous value                       |
| `01`   | Shift Right   | Bits shift right, MSB receives `s_right_din` |
| `10`   | Shift Left    | Bits shift left, LSB receives `s_left_din`   |
| `11`   | Parallel Load | Loads `p_din` into the register              |

---

# Functional Description

### Reset

When the reset signal `rst_n` becomes **0**, the register is cleared.

```
p_dout = 0000
```

---

### Shift Right

```
p_dout <= {s_right_din, p_dout[3:1]}
```

* All bits shift **one position to the right**
* New MSB comes from `s_right_din`
* LSB is shifted out as `s_left_dout`

Example:

```
Before Shift : 1011
s_right_din  : 0

After Shift  : 0101
```

---

### Shift Left

```
p_dout <= {p_dout[2:0], s_left_din}
```

* All bits shift **one position to the left**
* New LSB comes from `s_left_din`
* MSB is shifted out as `s_right_dout`

Example:

```
Before Shift : 1011
s_left_din   : 1

After Shift  : 0111
```

---

### Parallel Load

```
p_dout <= p_din
```

The register loads all bits simultaneously from the parallel input.

Example:

```
p_din  = 1100
p_dout = 1100
```

---

### Hold Operation

When `select = 00`, the register retains its previous value.

```
p_dout <= p_dout
```

---

# Serial Outputs

Two serial outputs are provided:

```
s_left_dout  = p_dout[0]
s_right_dout = p_dout[3]
```

* `s_left_dout` represents the **LSB**
* `s_right_dout` represents the **MSB**

These outputs are useful when chaining multiple shift registers.

---

# Applications

Universal Shift Registers are used in:

* Serial to Parallel Conversion
* Parallel to Serial Conversion
* Data buffering
* Digital signal processing
* Communication systems (SPI, UART)
* Processor datapath operations

---

# Simulation

The module can be simulated using tools such as:

* **Icarus Verilog**
* **GTKWave**
* **ModelSim**

Example simulation flow:

```
iverilog universal_shift_reg.v tb.v
vvp a.out
gtkwave waveform.vcd
```

---


