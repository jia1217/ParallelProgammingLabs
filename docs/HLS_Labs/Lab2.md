---
sort: 2
---


# Lab2 Pipelining

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"] ],
        displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
        processEscapes: false,
    }
  });
</script> 
    
<script type="text/javascript"
        src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

## Introduction

Pipelining is a widely used hardware trhoughput improvement method. Pipelining can be applied both to a loop and a function. In this example, pipelining any loop is not a good idea as it will reduce the II of the entire module (This is why we unrolled all the loops). The unrolled loops are not loops anymore from the hardware perspective, as unrolling makes all loop iterations run together in parallel. Hence, now the module has the following stages of operations:

> 1. Read new x and shift the TDL
> 2. MAC
> 3. Write y out (and clear shift_reg, when the last signal x comes)

Without pipelining, the operations are executed one by one, and new data can only be received after the last step is finished. Some resources can also be shared, for example, the adders in 2.1 can be reused in 2.3, though some extra logic may be required to control the dataflow. Pipelining, however, creates independent hardware for operation and some flip-flops to tap the inputs and middle results. The book ([Ref](https://kastner.ucsd.edu/hlsbook/)) gives an example for the MAC loop (though we are not pipelining the MAC loop here) shown below, (a) is without pipelining and (b) is with pipelining:

<img src="Images/2_1.png" alt="drawing" width="600"/>

Notice that no resources can be shared if the function is pipelined. Circuits at different stages are processing data simultaneously. For example, the circuit at the first stage is always processing the newest data, while the circuit at the second stage is always processing the data input (via shift register) from the previous cycle and the output from the first stage circuit. Hence, pipelining mostly requires more resources.

## Optimization


To pipeline the loop, we can simply add a pragma to the source file (under the function or loop header). The syntax is: ([Ref](https://docs.xilinx.com/r/en-US/ug1399-vitis-hls/pragma-HLS-pipeline))

```
#pragma HLS pipeline II=<int> off rewind style=<stp, frp, flp>
```

The II determines the throughput of the module. Mostly, we want the II=1 which means the module (loop) can receive new data every clock. In this case, we just tell the tool to pipeline the cordic function and the code becomes:


```c++
#include "cordic.h"

void cordic (
  cos_sin_t_stream& sin_stream,
  cos_sin_t_stream& cos_stream,
  theta_t_stream& theta_stream
){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=axis register_mode=both port=sin_stream
#pragma HLS INTERFACE mode=axis register_mode=both port=cos_stream
#pragma HLS INTERFACE mode=axis register_mode=both port=theta_stream
#pragma HLS PIPELINE style=stp
//or pragma HLS PIPIELINE stypel=flp
//or pragma HLS PIPELINE styple=frp

    static THETA_TYPE cordic_phase[NUM_ITERATIONS] = {
        0.78539816339745,   0.46364760900081,   0.24497866312686,   0.12435499454676,
        0.06241880999596,   0.03123983343027,   0.01562372862048,   0.00781234106010,
        0.00390623013197,   0.00195312251648,   0.00097656218956,   0.00048828121119,
        0.00024414062015,   0.00012207031189,   0.00006103515617,   0.00003051757812,
        0.00001525878906,   0.00000762939453,   0.00000381469727,   0.00000190734863,
        0.00000095367432,   0.00000047683716,   0.00000023841858,   0.00000011920929,
        0.00000005960464,   0.00000002980232,   0.00000001490116,   0.00000000745058
    };

    theta_t_pack theta_t_pack_temp;
    theta_stream >> theta_t_pack_temp;
    THETA_TYPE theta = theta_t_pack_temp.data;

    COS_SIN_TYPE current_cos = INIT_X;
    COS_SIN_TYPE current_sin = 0.0;


ROTATION_LOOP:
    for (int j = 0; j < NUM_ITERATIONS; j++){
        COS_SIN_TYPE cos_shift = current_cos >> j;
        COS_SIN_TYPE sin_shift = current_sin >> j;

        if (theta >= 0){
            current_cos = current_cos - sin_shift;
            current_sin = current_sin + cos_shift;
            theta -= cordic_phase[j];
        }
        else{
            current_cos = current_cos + sin_shift;
            current_sin = current_sin - cos_shift;
            theta += cordic_phase[j];
        }
    }

    cos_sin_t_pack cos_temp, sin_temp;
    cos_temp.data = current_cos;
    sin_temp.data = current_sin;
    cos_temp.keep = -1;
    sin_temp.keep = -1;
    cos_temp.last = theta_t_pack_temp.last;
    sin_temp.last = theta_t_pack_temp.last;

    sin_stream << sin_temp;
    cos_stream << cos_temp;
   
}
```

cordic.h

```c++
/*
Filename: cordic.h
	Header file
	CORDIC lab
*/
#ifndef CORDIC_H_
#define CORDIC_H_

#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include "ap_fixed.h"

#define PI (3.14159265f)

const int NUM_ITERATIONS = 28;
const float INIT_X = 0.60735;

typedef ap_fixed<32,8> THETA_TYPE;
typedef ap_fixed<32,2>	COS_SIN_TYPE;

typedef hls::axis<THETA_TYPE,0,0,0> theta_t_pack;
typedef hls::stream<theta_t_pack> theta_t_stream;
typedef hls::axis<COS_SIN_TYPE,0,0,0> cos_sin_t_pack;
typedef hls::stream<cos_sin_t_pack> cos_sin_t_stream;

void cordic (
  cos_sin_t_stream& sin_stream,
  cos_sin_t_stream& cos_stream,
  theta_t_stream& theta_stream
);

#endif
```




Testbench

```c++
/*
  Filename: cordic_test.h
  CORDIC lab wirtten for WES/CSE237C class at UCSD.
  Testbench file
  Calls cordic() function from cordic.cpp
  Compares the output from cordic() with math library
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "cordic.h"



int main (int argc, char** argv) {
  printf("Cordic rotation mode test:\n");
  cos_sin_t_stream sin_stream;
  cos_sin_t_stream cos_stream;
  theta_t_stream theta_stream;
  THETA_TYPE theta;

  float acc_error = 0;
  printf("Angle\t\t\tsin\t\t\tsin_gold\tcos\t\t\tcos_gold\terror\t\t\tacc_error\n");
  for (int i = 0; i < 16; i++){
    theta = i * PI / 16 / 2; // 16 steps from 0 to pi/2
    theta_t_pack theta_t_pack_temp;
    theta_t_pack_temp.data = theta;
    theta_t_pack_temp.keep = -1;
    theta_t_pack_temp.last = (i == 15);
    theta_stream << theta_t_pack_temp;

    cordic(sin_stream, cos_stream, theta_stream);

    cos_sin_t_pack sin_pack, cos_pack;
    sin_stream >> sin_pack;
    cos_stream >> cos_pack;
    float sin_golden = sin((float)theta);
    float cos_golden = cos((float)theta);

    float new_error = pow((float)cos_pack.data-(float)cos_golden,2) + pow((float)sin_pack.data-(float)sin_golden,2);
    acc_error += new_error;

    printf("%3.3f    :\t\t%1.4f\t\t%1.4f\t\t%1.4f\t\t%1.4f\t\t%1.8f\t\t%1.8f\n",(float)theta,(float)sin_pack.data,(float)sin_golden,(float)cos_pack.data,(float)cos_golden,new_error, acc_error);
  }
  if(acc_error / 16 < 0.0001){
	  printf(" +---------------------+\n");
	  printf(" |        PASS!        |\n");
	  printf(" +---------------------+\n");
	  printf("Mean error = %.8f\n",acc_error / 16);
	  return 0;
  }
  else{
	  printf(" +---------------------+\n");
	  printf(" |        FAIL!        |\n");
	  printf(" +---------------------+\n");
	  printf("Mean error = %.8f\n",acc_error / 16);
	  return -1;
  }
}
```

According to the synthesis report, now the II of the entire module becomes 1 and 3213 FFs and 8452 LUTs are required. 

#### Remaining Issue: Pipeline Type
According to Xilinx Doc, the HLS supports three types of pipelines: ([Ref](https://docs.xilinx.com/r/en-US/ug1399-vitis-hls/pragma-HLS-pipeline))  

**Stalled pipeline (STP)**  (Default pipeline; no usage constraints)  
Advantages:
> Lowest overall resource usage.  

Disadvantages:
> Not flushable:  
>> Lead to deadlock in the dataflow.  
>> Prevent already calculated output data from being delivered, if the inputs to the next iterations are missing.  
> Timing issues due to high fanout on pipeline controls ("enable" signal distributed to all processing elements, or stages, in a pipeline structure).  

Let us take a pipeline structure with three stages as an example. As is shown in the following figure, one "enable" signal is shared with three stages (this causes a fanout issue of the pipeline control signal). If the input data continuously comes in, a stalled pipeline should work properly. Now, considering a stream of data with a fixed length, after the last data arrives, the input valid becomes '0'. Since no valid data comes in after this, the first stage of the pipeline is closed (set "enable" to 0). Consequently, the second and third stages of the pipeline are also closed, stopping the data from flowing out from the pipeline (not flushable). 

A typical solution is to add some zeros after the last data of the stream to push the useful data out. Though the solution looks promising, it is hard for programming as the added zeros also need to be removed from the output of the next stream manually. The specific implementation of the circuit can be viewed under the 'Schematic' option in the Vivado IMPLEMENTATION report.

<img src="Images/2_2.png" alt="drawing" width="500"/>

<img src="Images/2_3.png" alt="drawing" width="500"/>


**Flushable Pipeline (FLP)**  
A flushable pipeline is a better choice when processing multiple streams of data.  
Advantages:
> Flushable

Disadvantages:
> More resources 

In a flushable pipeline, once the input data becomes invalid, it shuts down pipeline stages successively, until the final input is processed and moved to the output, rather than closing all stages at once. The structure is shown below.

<img src="Images/2_4.png" alt="drawing" width="300"/>

<img src="Images/2_5.png" alt="drawing" width="300"/>

<img src="Images/2_6.png" alt="drawing" width="600"/>

In the FIR application, unless the input data comes directly from an ADC (infinite data stream), a flushable pipeline is preferred.

**Free-Running/Flushanle Pipeline (FRP)**  
Though the FLP reduces some fanout of the pipeline controlling signal, it is still not perfect as one pipeline may have hundreds of FFs to control. Free running pipeline further simplifies it.   
Advantages:
> Flushable
> Better Timing:  
>> Less fanout  
>> simpler pipeline control logic  

Disadvantages:
> Moderate resource increase due to FIFOs added on outputs; 
> Energy inefficient  

The structure is shown below:

<div align=center><img src="Images/2_7.png" alt="drawing" width="1000"/></div>


The "enable" signal for the first stage is optional. It is only required when a shift register is placed at the first stage (if the input is not valid, the shift register shouldn't run). FRP keeps the following stages running. The output valid signal is generated from the valid_in. Therefore, a minimum number of "enable" signals is required. However, making the circuit run continuously is not energy efficient.

> (Important) Free-running kernel and free-running pipeline are different concepts. The free-running kernel means the entire module doesn't require any 'start' signal and is always ready to receive new data. The free-running pipeline is one structure to implement the pipeline.  

## Implementation

### Create Cordic IP

To generate the IP, you should do several steps in the below.

* Launch Vitis HLS: Open Xilinx Vitis HLS directly launch it from your system.

* Create a New Project: Start a new project in Vitis HLS. Specify the project name, location, and target device or platform. Here we can choose the device as below.

<div align=center><img src="Images/2_8.png" alt="drawing" width="600"/></div>

* Write or Import Code: Write your hardware function in C, C++, or SystemC. This code will describe the behavior you want to implement in hardware. Alternatively, you can import 
existing C/C++ code if available and you can click the green button "Run C Simulation" to verify the result of the function.

<div align=center><img src="Images/2_9.png" alt="drawing" width="300"/></div>

* Optimize and Synthesize: After writing or importing your code, use Vitis HLS to synthesize and optimize the code and you can click the green button "Run C Synthesis". The tool will generate a hardware description from your high-level code as shown in the below.

<div align=center><img src="Images/2_10.png" alt="drawing" width="800"/></div>

* Verify and Test: Verify the synthesized hardware behavior using test benches or co-simulation. Ensure that the hardware function behaves as expected. If the result of the Cosimulation is **PASS**, you can export the IP. At the same time, you can also click "Wave Viewer" to see the result of the input and output data of the IP.

<div align=center><img src="Images/2_11.png" alt="drawing" width="200"/></div>

* Generate IP Core: Once you have verified the hardware behavior and are satisfied with the synthesis results, you can generate an IP core from the synthesized hardware function.
In Vitis HLS, go to the "Solution" tab and select "Export RTL..." or a similar option depending on your version of Vitis HLS. Follow the prompts to generate an IP core.
This process will generate the necessary VHDL or Verilog files and associated metadata to create an IP core that you can integrate into your Vivado FPGA or SoC design.

### Create Vivado Project

The configure block design can use reference materials [here](https://uri-nextlab.github.io/ParallelProgammingLabs/HLS_Labs/Lab1.html)

The differenc between the lab1 and lab2 is the AXI_DMA. For this IP, we need one read interface and two write interfaces. We have deliberately configured AXI_DMA0 with only the read channels enabled and configured AXI_DMA1 and AXI_DMA2 with only the write channel enabled. This design choice is driven by the predominant data flow requirements of our IP core, which involves receiving data from memory.   

<div align=center><img src="Images/2_12.png" alt="drawing" width="700"/></div>

## Run synthesis,  Implementation and generate a bitstream

It may show some errors about I/O Ports, please fix them.

## Download the bitstream file to PYNQ

The first step is to allocate the buffer. pynq allocate will be used to allocate the buffer, and NumPy will be used to specify the type of the buffer.

```python
from pynq import Overlay
from pynq import allocate
import matplotlib.pyplot as plt
import numpy as np
import time
hw = Overlay("design_1_wrapper.bit")
hw ?

We can use the ? to check the IP dictionary.
```

<div align=center><img src="Images/1_6.png" alt="drawing" width="400"/></div>

### Create DMA instances

Using the labels for the DMAs listed above, we can create three DMA objects.

```python

mm2s = hw.axi_dma_0.sendchannel
s2mm_1 = hw.axi_dma_1.recvchannel
s2mm_2 = hw.axi_dma_2.recvchannel
```

### Read DMA

The first step is to allocate the buffer. pynq.allocate will be used to allocate the buffer, and NumPy will be used to specify the type of the buffer.

```python
theta =[0x0 , 0x001921fb , 0x003243f6 , 0x004b65f2 , 0x006487ed , 0x007da9e9 , 0x0096cbe4 , 0x00afede0 , 0x00c90fdb , 0x00e231d6 , 0x00fb53d2 , 0x11475ce , 0x12d97c8 , 0x146b9c4 , 0x15fdbc0 ,0x178fdba]

N = 16
oBuf_sin = allocate(shape=(N,), dtype = np.int32)
oBuf_cos = allocate(shape=(N,), dtype = np.int32)
iBuf = allocate(shape=(N,), dtype = np.int32)

for i in range(N):
    iBuf[i]= theta[i]
    print(iBuf[i])

```

```python
mm2s.transfer(iBuf)
s2mm_1.transfer(oBuf_sin)
s2mm_2.transfer(oBuf_cos)
mm2s.wait()
s2mm_1.wait()
s2mm_2.wait()

```

We will see:

<div align=center><img src="Images/2_13.png" alt="drawing" width="400"/></div>

<div align=center><img src="Images/2_15.png" alt="drawing" width="400"/></div>

<div align=center><img src="Images/2_14.png" alt="drawing" width="1000"/></div>

But when use the #pragma HLS PIPELINE style=stp, the result is the below.

<div align=center><img src="Images/2_16.png" alt="drawing" width="800"/></div>

