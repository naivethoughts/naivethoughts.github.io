---
layout: post
title: "Project Euler : Problem 25"
date: 2020-02-05
excerpt: "Project Euler : Problem List 20 - 30"
tags: [Project Euler, HackerRank, Python]
comments: false
codes: false
---
Last updated : 02/05/2020

## Problem 25 :
The <a href="https://projecteuler.net/problem=25" target="_blank">Fibonacci Series </a> is, <br/>
$$ F(n) = F(n-1) + F(n-2) $$ <br/>
$$ F(1) = F(1) + F(0) = 1 + 0 = 1 $$ <br/>
To find the term in the series with 1000 digits, the straight forward approach is to
compute the next term in the series till the first 1000 digit number and display the
index corresponding to the number.

To solve this problem, a lookup table containing indices upto 5000 digits was created.
From the lookup table, the location of the appearance of first N digit Fibonacci number
could be calculated easily. The first **1000** digit number is **4782** th and **5000** digit number is **23922** th Fibonacci term.

```python
def computeFibonacci(n=5001):
    a = 0
    b = 1
    i = 1
    fibLenCalc = [0,1]
    while (len(fibLenCalc) < n):
        a,b,i=b,a+b,i+1
        if(len(str(b))>len(str(a))):
            fibLenCalc.append(i)
    return(fibLenCalc)

dataCalc = computeFibonacci(5001)
for _ in range(int(input())):
    print(dataCalc[int(input())])
```

From Binet's formula,
\\( F(n) = \frac{\phi^n}{\sqrt{5}} \\)
For the Fibonacci number with N digits, $$ F(n) = 10^{N} $$. Simplifying,
\\( n > \frac{N log(10) + 0.5 \times log(5)}{log(\phi)} \\)

```python
import math
phi = (1.0 + math.sqrt(5))/2.0
numA = 0.5*math.log10(5)
denA = math.log10(phi)
for _ in range(int(input())):
    n = float(input()) - 1
    print(math.ceil((n+numA)/denA))
```
