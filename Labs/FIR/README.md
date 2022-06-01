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
### Code

```c++
#include "ap_int.h"

#define N 11

// Not optimzied code in Figure 2.1

typedef int coef_t;
typedef int data_t;
typedef int acc_t;

void fir(data_t *y, data_t x){
    coef_t c[N] = {
        53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53
    };
    static data_t shift_reg[N];
    acc_t acc;
    int i;

Shift_Accum_Loop:
    for (i = N - 1; i >= 0;i--){
        if (i == 0){
            acc += x * c[0];
            shift_reg[0] = x;
        }
        else{
            shift_reg[i] = shift_reg[i-1];
            acc += shift_reg[i] * c[i];
        }
    }
    *y = acc;
}
```
### Sythesis Result

```

================================================================

== Performance Estimates

================================================================

+ Timing: 

* Summary: 

    +--------+----------+----------+------------+

    |  Clock |  Target  | Estimated| Uncertainty|

    +--------+----------+----------+------------+

    |ap_clk  |  10.00 ns|  6.912 ns|     2.70 ns|

    +--------+----------+----------+------------+



+ Latency: 

    * Summary: 

    +---------+---------+----------+----------+-----+-----+---------+

    |  Latency (cycles) |  Latency (absolute) |  Interval | Pipeline|

    |   min   |   max   |    min   |    max   | min | max |   Type  |

    +---------+---------+----------+----------+-----+-----+---------+

    |       30|       30|  0.300 us|  0.300 us|   31|   31|       no|

    +---------+---------+----------+----------+-----+-----+---------+




```

The Interval and Latency are extremely high (over 30 clocks) and not pipelined.
