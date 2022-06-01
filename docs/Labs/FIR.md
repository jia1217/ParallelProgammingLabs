---
sort: 1
---

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      processEscapes: true
    }
  });
</script>
    
<script type="text/javascript"
        src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

# FIR Project


Finate impulse response filter is widely used. The algorithm is simply shown below:
$$y[i] = \sum_{j = 0}^{N-1}h[j]x[i-j]$$
where $h[j]$ is the impulse response.



## Highly unoptimzied code
### fir.h
```c++

/*
Filename: fir.h
	Header file
	FIR lab
*/
#ifndef FIR_H_
#define FIR_H_

#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include "ap_fixed.h"

const int N=11;

typedef int	coef_t;
typedef int	data_t;
typedef int	acc_t;

typedef hls::axis<data_t,0,0,0> data_t_pack;
typedef hls::stream<data_t_pack> d_stream;

void fir (
  d_stream& y,
  d_stream& x
);

#endif

```
### fir.cpp
```c++
#include "fir.h"

// Not optimzied code in Figure 2.1

void fir(d_stream& y, d_stream& x){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=axis register_mode=both port=y
#pragma HLS INTERFACE mode=axis register_mode=both port=x
    coef_t c[N] = {
        53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53
    };
    static data_t shift_reg[N];
    data_t_pack x_temp;
    acc_t acc = 0;
    int i;
    x >> x_temp;

// Algorithm
Shift_Accum_Loop:
    for (i = N - 1; i >= 0;i--){
        if (i == 0){
            acc += x_temp.data * c[0];
            shift_reg[0] = x_temp.data;
        }
        else{
            shift_reg[i] = shift_reg[i-1];
            acc += shift_reg[i] * c[i];
        }
    }

// Output Stream
    data_t_pack y_temp;
    y_temp.data = acc;
    y_temp.keep = -1;
    y_temp.last = x_temp.last;
    y << y_temp;
    
  // Clear at the last data
    if (x_temp.last){
Clear_Loop:
    	for (i = N - 1; i >= 0;i--){
            shift_reg[i] = 0;
        }
    }
}

```
### Sythesis Result
According to the report, the key loop (Shift_Accum_Loop) has II=2 and the II of the IP block is 31, which means this IP can only receive 1 data every 31 clock cycles. This is extremely slow. An optimized design should have the II of the module equal 1 (receive a new data every clock). This design costs 442 FFs and 265 LUTs for the Shift_Accum_Loop.

The II = 2 comes from a fake data dependency. Since the hardware circuit is always running (the code in software can be run dependentlt), which means the the two branches in the Shift_Accum_Loop both have  a hardware implementation. For a pipelined structure, all the operations in the loop have a hardware as well. In the Shift_Accum_Loop, there are one read operation (acc += shift_reg[i] * c[i];) and two write operations (acc += shift_reg[i] * c[i]; shift_reg[i] = shift_reg[i-1];), which means the shift_reg should be implemented as a RAM with one read port and two write ports, which is impossible. Therefore, the tool failed to make the II = 1 because of the confliction between the two write (store) operation. It can be checked in the console systhesis log:

>  The II Violation in module ... Unable to enforce a carried dependence constraint (II = 1, distance = 1, offset = 1) between '**store**' operation of variable 'shift_reg_load', ./srcs/fir.cpp:25 on array 'shift_reg' and '**store**' operation ('0_write_ln22', ./srcs/fir.cpp:22) of variable 'tmp_data_1_read' on array 'shift_reg'.
 
## Optimation 1: Remove if/else branches in for loop:
The if/else operation is inefficient in for loop. Loop hoisted can be carried out.  "HLS tool creates logical hardware that checks if the condition is met, which is executed in every iteration of the loop. Furthermore, this conditional structure limits the execution of the statements in either the if or else branches; these statements can only be executed after the if condition statement is resolved."[^1] Now the "Shift_Accum_Loop" becomes:
```c++
Shift_Accum_Loop:
    for (i = N - 1; i > 0;i--){
        shift_reg[i] = shift_reg[i-1];
        acc += shift_reg[i] * c[i];
    }

    acc += x_temp.data * c[0];
    shift_reg[0] = x_temp.data;
```
With the new implementation, the II of the "Shift_Accum_Loop" becomes 1 and the II of the entire module becomes 18. This is huge improvement. However, this performance increasement does not caused directly from the  loop  hoisting optimization. Moving branch i == 0 out just happens to reduce one write operation to the shift_reg. This design costs 407 FFs and 196 LUTs, which is less than the original code because of the loop c optimization. 

[^1]: [Parallel Programming for FPGAs ]()


