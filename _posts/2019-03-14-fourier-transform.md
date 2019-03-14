---
layout: post
title: "Fourier Transforms using Matlab Codes"
date: 2019-03-14
excerpt: "Fourier Transform code to obtain spectrum and power for alternating
component of the signal"
tags: [Fourier Transform, Matlab]
comments: false
codes: true
---

## Important points to note :
* First element of the Fourier transform, corresponds to the zeroth frequency -
DC component of the signal analyzed.

```Matlab
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

<a class="btn zoombtn" href="{{ site.url }}/codes/FFT_DATA.m">download  </a>

Syntax
```Matlab
 [Freq,DFT,Power] = FFT_DATA(rawData, SamplingFrequency)
```

Adapted from
*[Matlab Sunspots example](https://www.mathworks.com/help/matlab/examples/using-fft.html)
*[Matlab Spectral Analysis example](https://www.mathworks.com/help/matlab/examples/fft-for-spectral-analysis.html)

More interesting information can be found at

*[http://www.thefouriertransform.com/](http://www.thefouriertransform.com/)
*[https://jackschaedler.github.io/circles-sines-signals/dft_introduction.html](https://jackschaedler.github.io/circles-sines-signals/dft_introduction.html)
