---
sort: 3
---


## DFT (Matrix-Vector Multipliation)


## Introduction
Discrete Fourier Transform (DFT) is widely used in digital signal processing (Fast-Fourier Transform, FFT, is an optimized algorithm to calculate DFT). The formula is simple:

$$
X(k) = \sum_{n = 0}^{N - 1}x(n)e^{-j\frac{2\pi}{N}nk}
$$

Given a certain $k$, DFT is actully a inner product between series $x(n)$ and a complex rotating vector $e^{-j\frac{2k\pi}{N}n}$. Therefore, let $x(n)$ written as a column vector $\vec{x}$, and $e^{-j\frac{2k\pi}{N}n}$ written as a row vector $\vec T_k$, we have $X(k) = \vec T_k \cdot \vec x$. Hence, the entire transform becomes a Matrix-Vector Multiplication (MTV).

$$
\begin{equation}
\left[\begin{matrix}
X(0)\\
X(1)\\
...\\
X(N-1)
\end{matrix}\right]
=\left[\begin{matrix}
\vec T_0\\
\vec T_1\\
...\\
\vec T_{N-1}
\end{matrix}\right]
\vec x
\end{equation}
$$

$$
\vec T_k = e^{-j\frac{2k\pi}{N}n}, n = 0,1,2,...,N-1
$$

## Inner product implementation

The MTV can be treated as $N$ inner products between the row vectors in Matrix and the column vector. The inner product is easy to be implemented with the following code:

```c++
int acc = 0;
for (int i = 0; i < N; i++){
    acc += t[i] * x[i];
}
```

The loop can either be pipelined or unrolled, depending on the data accessibility. For example, mostly the input $\vec x$ comes from a stream interface, which infers that in each clock cycle, only one $x[i]$ is available. In this case, even when the loop is unrolled, it still requires at least $N$ clocks to finish, which is the same with the pipelined structure. This structure is shown in (a) below. However, if both $x$ and $t$ have higher accessibility, it is possible to carry out more multiplications in each clock cycle and then reduce the trip count. For example, in (b), $x$ and $t$ are saved in two blocks. Therefore, in each cycle, two multiplications can be done. In another word, the 'for' loop can be unrolled by a factor of 2 in this case. Furthermore, if the $x$ and $t$ are completely partitioned, it is possible to finish all multiplication and the 'for' loop can be fully unrolled. In summary, data accessibility determines the parallelism of the implementation. The unroll factor should be picked carefully depending on how much data is available in one cycle. Also, if unroll is required to increase the performance, the memory used to save the data should also be changed accordingly. Xilinx provides 'array_partition' pragma to specify the data accessibility ([Ref](https://docs.xilinx.com/r/en-US/ug1399-vitis-hls/pragma-HLS-array_partition)). In general, if the memory is implemented with BRAM on FPGA, two data is available in each cycle. If the memory is implemented with FFs (completely partitioned), all data is available in one clock cycle.  

<img src="./imgs/DotProduct.png" alt="drawing" width="300"/>

## MTV Implementation

The MTV is $N$ dot products. It can be realized with the following code:

```c++
int T[N][N];
int X[N] = {0};
COL_LOOP:
for (int i = 0; i < N; i++){
ROW_LOOP:
    for(int j = 0; j < N; j++){
        X[j] += T[j][i] * x[i];
    }
}
```

The first thing to do is to determine which loop should be the first. In this example, we assume that $x$ comes in series, which means only $x[i]$ comes in order and only one $x[i]$ is available in each cycle. In this case, once a new $x[i]$ is received, we should finish all computations that require $x[i]$ all some extra memory is required to save the $x$ for future use. Hence, the $i$ loop should be the first. If not, then $x$ has to be iterated in each outer loop. Then, the second step is to determine the data accessibility in the ROW_LOOP. In the ROW_LOOP (j), the $i_{th}$ value in all rows of $T$ are required. Then, if we don't do any partition to array $T$, only one $T[j][i]$ is available in each cycle, which means it takes $N^2$ trips to finish the operation. Partitioning the $T$ array in the second dimension doesn't help as only one $xi$ is available. Even though we have more value in the same row available, no computation can be done. Partitioning the $T$ array in the first dimension makes the data in different rows available at the same time, which helps reduce the trip count. For example, if we completely partition the $T$ in the first dimension, the ROW_LOOP can also be fully unrolled, generating $N$ independent dot product instances like the figure (a) in the last section (see Figure 4.12 in the textbook as well).  

## Result
