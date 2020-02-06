---
layout: post
title: "Project Euler : Problem 1"
date: 2020-02-05
excerpt: "Multiples of 3 and 5"
tags: [Project Euler, HackerRank, Python]
projectEuler: true
comments: false
---
Last updated : 02/05/2020

## <a href="https://projecteuler.net/problem=1" target="_blank"> Problem 1 </a>
Sum of *n* natural numbers is given by<br/>
\\( \sum(n) = \frac{(n)(n+1)}{2} \\)<br/>

The required result is the sum of all multiples of 3 till n and sum of all multiples of 5 till n.
However, we have multiples of 15 counted twice, since it can be prime factorized into 3 and 5. Therefore
from the previous sum, we need to subtract the multiples of 15.

For finding the required sum using the sum of natural number formula under *N*, the *n* for 3, 5 and 15 are the quotient of n/3, n/5, n/15 and multiplying each sum by 3, 5 and 15 respectively. It can be represented as <br\>
\\( 3 \sum(n//3) + 5 \sum(n//5) - 15 \sum(n//15) \\)

```python
#!/bin/python3
import sys

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())
    cSum = 0
    n = n-1
    dbthree = n//3
    dbfive = n//5
    dbfifteen = n//15
    cSum = 3*(dbthree*(dbthree+1)) + 5*(dbfive*(dbfive+1)) - 15*(dbfifteen*(dbfifteen+1))
    cSum = cSum>>1
    print(cSum)
```
Instead of using the sum of natural numbers equation, one can also use the sum of arithmetic series formula <br/>
\\( \sum(n) = \frac{n}{2} (2 a_{1} + (n -1) d) \\) <br\>
Here, a_{1} is the first element of the series, n is the number of elements of the series, d is the difference between successive terms. In this case inorder to find number of elements in the series, n = quotient(N,d).
