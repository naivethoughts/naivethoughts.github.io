---
layout: post
title: "Fourier Transforms using Matlab"
date: 2019-03-13
excerpt: "Fourier Transforms"
tags: [Fourier Transform, Matlab]
comments: true
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
