---
sort: 5
---


# Lab5 

In this lab, you need to install the Vivado locally.

## Introduction

In this lab you will use the uart_led design that was introduced in the previous labs. You will use Mark Debug feature and also the available Integrated Logic Analyzer (ILA) core (in IP Catalog) to debug the hardware.

## Objectives

After completing this lab, you will be able to:

* Use the Integrated Logic Analyzer (ILA) core from the IP Catalog as a debugging tool.

* Use Mark Debug feature of Vivado to debug a design.

* Use hardware debugger to debug a design.

## Design Description

The design consists of a uart receiver receiving the input typed on a keyboard and displaying the binary equivalent of the typed character on the LEDs. When a push button is pressed, the lower and upper nibbles are swapped.

## Steps

### Step 1 Create new project and add source

Please copy the whole Lab2 project and named it as *Lab5*:

### Step 2 Add the ILA Core

* Click *Open Block Design* under *IP INTEGRATOR*.

* Choose the Port you want to debug. If you can't find the port in the exist diagram, we can change the top file code and pull the port out. For example, I am interesting in `rx_data_rdy` and `rx_data`, but I can't find it. Then we can back to the code, change it like following:

```verilog
    module uart_led (
      // Write side inputs
      input            clk_pin,      // Clock input (from pin)
      input            rst_pin,      // Active HIGH reset (from pin)
      input            btn_pin,      // Button to swap high and low bits
      input            rxd_pin,      // RS232 RXD pin - directly from pin
      output     [3:0] led_pins,      // 8 LED outputs
      output             rx_data_rdy,  // Data ready output of uart_rx
      output [7:0]       rx_data      // Data output of uart_rx
    );
```

* Back to *Diagram* window, select `uart_led_0` module and right click `Refresh module`, then you can see the port. Select one port (like `rx_data_rdy`), right click it and choose `debug`.

* Similiar operation to the other port.

* Click `Run connection Automation` and choose all. 

<div align=center><img src="imgs/5_1.png" alt="drawing" width="600"/></div>

* If you want to combina two wires into one ILA, we can delete one (for example, `system_ila_0`) and double click (i.e. `system_ila_1`). And set the `NUmber of Probes` as 2.

<div align=center><img src="imgs/5_2.png" alt="drawing" width="600"/></div>

* We need to connect the `clk` of ilas by ourself. We can connect them to the `clk_pin_0`. Just make sure that the clk signal is the sychronize.

<div align=center><img src="imgs/5_3.png" alt="drawing" width="600"/></div>

### Step 3 Run synthesis, implementation and generate bitstream

* Click PROGRAM AND DEBUG --> Open Hardware Manager --> Open Target

* Choose `Auto connect`. Remember to turn on the PYNQ board.

* Select `Program Device` and download the bitstream file to the board.

<div align=center><img src="imgs/5_4.png" alt="drawing" width="600"/></div>

* The programming bit file be downloaded and the DONE light will be turned ON indicating the FPGA has been programmed. Debug Probes window will also be opened, if not, then select Window > Debug Probes. In the Hardware window in Vivado notice that there are two debug cores, hw_ila_1 and hw_ila_2. The hardware session status window also opens showing that the FPGA is programmed having two ILA cores with the idle state.

<div align=center><img src="imgs/5_5.png" alt="drawing" width="600"/></div>

* Select the target FPGA xc7z020_1, and click on the Run Trigger Immediate button to see the signals in the waveform window. Two waveform windows will be created, one for each ILA; one ILA window is for the instantiated ILA core and another for the MARK DEBUG method.

<div align=center><img src="imgs/5_6.png" alt="drawing" width="600"/></div>

### Setup trigger conditions to trigger on a write to led port (rx_data_rdy_out=1) and the trigger position to 512. Arm the trigger.

* In the Trigger Setup window, click Add Probes and select the rx_data_rdy.

<div align=center><img src="imgs/5_7.png" alt="drawing" width="600"/></div>
