---
sort: 2
---


# Cordic

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

Cordic, or Coordinate Rotation Digital Computer, is widely used to calculate trigonometric functions, hyperbolic functions, square roots, multiplications, divisions, and exponentials and logarithms with arbitrary base, typically converging with one digit (or bit) per iteration. the only operations it requires are additions, subtractions, bitshift and lookup tables. The only operations it requires are **additions**, **subtractions**, **bitshift** and **lookup tables**.  

The CORDIC algorithm is based on vector rotation. Let $z$ be an imaginary number equals $x+jy=\sqrt{x^2+y^2}e^{j\cdot arctan(\frac{y}{x})}=re^{j\theta}$, where $j$ is the imaginary unit, $r=\sqrt{x^2+y^2}$ and $\theta=arctan(\frac{y}{x})$. If we want to rotate the vector by $\phi$, we can simply times $z$ by $e^{j\phi}$. Hence, if we transfer back to Cartesian coordinate system, we have:

$$
\begin{equation}
\begin{aligned}
z' &= z\cdot e^{j\phi} \\
   &= (x + jy)\left(\cos(\phi) + j\sin(\phi)\right) \\
   &= (\cos(\phi)x-\sin(\phi)y) + j(\cos(\phi)y+\sin(\phi)x)
\end{aligned}
\end{equation}
$$

Therefore, if we let $z'=x'+jy'$, and use matrix form to represent the rotation, we have:

$$
\begin{equation}
\left[\begin{matrix}
x'\\
y'
\end{matrix}\right]
=\left[\begin{matrix}
\cos(\phi) & -\sin(\phi)\\
\sin(\phi) & \cos(\phi)
\end{matrix}\right]
\left[\begin{matrix}
x\\
y
\end{matrix}\right]
\end{equation}
$$

Note that the rotation doesn't change the length of the vector. To make the algorithm easily implemented with hardware, we have to simplify the multiplication operation here. In hardware, it is always easy to time a number with $2^N$ as it is only required to shift left by $N$ bits ($N$ can be negative). Therefore, they did a little transformation to the Eq. (2) firstly.

$$
\begin{equation}
\left[\begin{matrix}
x'\\
y'
\end{matrix}\right]
=\cos(\phi)\left[\begin{matrix}
1 & -\tan(\phi)\\
\tan(\phi) & 1
\end{matrix}\right]
\left[\begin{matrix}
x\\
y
\end{matrix}\right]
\end{equation}
$$

Then, if we make $\tan(\phi_i)=\frac{1}{2^i}$ or $\phi_i=arctan(2^{-i})$, where $i$ is a non-negative integer, all the multiplications in the matrix-vector multiplication becomes either keep the original value (times by 1) or shift right by $i$ bits (times $2^{-i}$). The only problem left is the timing the $\cos(\phi_i)$. 