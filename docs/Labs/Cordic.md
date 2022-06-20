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

Then, if we make $\tan(\phi_i)=\frac{1}{2^i}$ or $\phi_i=arctan(2^{-i})$, where $i$ is a non-negative integer, all the multiplications in the matrix-vector multiplication becomes either keep the original value (times by 1) or shift right by $i$ bits (times $2^{-i}$). Therefore, the rotation angles are:

$$
\phi_i=\arctan(2^{-i}),i = 0,1,2,...
$$

We can get the corresponding angles as $45\degree, 26.57\degree, 14.04\degree, ...$. It can be proved that any angle with $0\to90\degree$ can be represented as the sum of these angles, which means with enough $\phi_i$ summed up, we can calculate any $\cos$ and $\sin$ values.  

However, the multiplication with $\cos(\phi_i)$ hasn't been solved yet. Since

$$
\begin{equation}
\begin{aligned}
\cos(\phi_i) &= \sqrt{\cos^2(\phi_i)} \\
             &= \sqrt{\frac{\cos^2(\phi_i)}{\cos^2(\phi_i)+\sin^2(\phi_i)}} \\
             &= \frac{1}{\sqrt{1+\tan^2(\phi_i)}}
\end{aligned}
\end{equation}
$$

and $\phi_i=\arctan(2^{-i})$, we have

$$
\cos(\phi_i) =  \frac{1}{\sqrt{1+\tan^2(\arctan(2^{-i}))}}=\frac{1}{\sqrt{1+2^{-2i}}}
$$

Hence, we can combine all the $\cos(\phi_i)$ together as a final scale coefficient $K$:

$$
K = \lim_{n\to\infty} K(n) = \lim_{n\to\infty}\prod_{i = 0}^{n-1}\frac{1}{\sqrt{1+2^{-2i}}} \approx 0.60725
$$

Therefore, if we do rotations to a unit legth vector just with the following simplified formula (only bit shifting and adding are required), the final length of the vector would be $1/K$, which is further defined as Cordic Gain $A = 1.6768$.

$$
\begin{equation}
\left[\begin{matrix}
x'\\
y'
\end{matrix}\right]
=\left[\begin{matrix}
1 & -2^{-i}\\
2^{-i} & 1
\end{matrix}\right]
\left[\begin{matrix}
x\\
y
\end{matrix}\right]
\end{equation}
$$

Then with circular rotation based Cordic, we have two modes: Rotation Mode and Vector Mode.

## Rotation Mode
Rotation Mode is used to calculate $\sin$, $\cos$ and the related values such as $\tan$ of a given angle $\alpha$. Let's assume $0<\alpha\leq\pi$ here (if not, we can map the required angle to this domain as sinusoid functions are periodic). In Rotation Mode, we first initialize the initial vector $V_0$ with $x_0=K$ and $y_0=0$, which is a scaled vector pointing towards the positive $x$ axis direction, and its length is $K$. Then we rotate the vector towards the target $\alpha$. Let's assume the initial angle is $\beta_0=0$. The first rotation must be positive $\phi_0 = 45\degree$ (counterclockwise) as $\alpha > \beta_0$. Now, we have $\beta_1=45\degree$. The second rotation angle is $26.57\degree$, and we rotate counterclockwise if $\alpha > \beta_0$ or clockwise if $\alpha < \beta_0$. Continue this iteration typically 48 times, the final $\beta$ should approximately equal to $\alpha$. And since the initial length of the vector is $K$, the final length of the vector is $1$, which means the final $y=\cos(\alpha)$ and final $x=\sin(\alpha)$.  

<img src="https://upload.wikimedia.org/wikipedia/commons/8/89/CORDIC-illustration.png" alt="drawing" width="300"/>


## Vector Mode

Vector mode is similar, while the initial vector is user-defined and the targeted angle is always $0\degree$. For example, if we initialize the $V_0$ with $x= x_0$ and $y=y_0$ (the initial angle is $\arctan(\frac{y_0}{x_0})$), and rotate the angle towards $0\degree$, the final length of the vector is $A\times|V_0|=A\sqrt{x_0^2+y_0^2}$, which is exactly the final $x$ as the angle is rotated to $0\degree$. However, since the final value is not $\sqrt{x_0^2+y_0^2}$ directly, the division is required either for the final result or the initial value of $x,y$. Hence, the Vector Mode with trigonometric functions is not that useful. However, with hyperbolic functions to replace the $\sin and \cos$ here, the square root of any given value can be calculated directly with Cordic ([Ref](https://www.youtube.com/watch?v=3g6bkSDvYQM)).  

# Cordic Implementation