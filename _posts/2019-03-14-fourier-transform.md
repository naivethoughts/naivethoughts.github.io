---
layout: post
title: "Fourier Transforms using Matlab Codes"
date: 2019-03-14
excerpt: "Fourier Transforms"
tags: [Fourier Transform, Matlab]
comments: false
codes: true
---

## Important points to note :
* First element of the Fourier transform, corresponds to the zeroth frequency -
DC component of the signal analyzed.

```matlab
t = 1:0.01:100;
fx = 5 + sin(2*pi()*t);
Fx = fft(fx);
Fx(1)/length(Fx)

```

The above code would yield the result 5, implying the zero frequency contains the
total power of the system.

* Second point to be noticed is the data can be normalized by the length of data.

* The fft function of matlab produces a symmetric Discrete Fourier Transform (DFT)
about the [Nyquist Frequency](https://en.wikipedia.org/wiki/Nyquist_frequency).
Hence *[fftshift](https://www.mathworks.com/help/matlab/ref/fftshift.html)*, can
be used to shift zero frequency to the center.

* Alterntively, the alternating component would range from the second element of
DFT to half of the sampling frequency (fs).

* Finally to obtain, the power of the signal multiplying by a conjugate of the DFT
would suffice.

The Matlab one dimensional fft code to evaluate the alteranating component can
be obtained from

[github](https://github.com/)
