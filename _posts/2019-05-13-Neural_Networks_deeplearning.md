---
layout: post
title: "Neural Network - Coursera, deeplearning.ai"
date: 2019-05-13
excerpt: "Neural Networks, Course #1 from deeplearning.ai"
tags: [Machine-Learning, Python, Neural Network]
comments: false
codes: true
---

# Lectures

## Week 1 :
### Lecture 1 : What is a neural network?
Predictions(y) by any model depends on several parameters(x1,x2..xn). A well trained
neural network model assigns a weight to each of the parameter, based on the available
training data. The weights, thus assigned, are used to make new predictions.
### Lecture 2 : Supervised Learning with a neural network
Data come across in the form of structured data (tables,matrices etc.) and unstructured
data(images, sounds etc.). Machines were traditionally exceptional in handling structured data,
and humans in unstructured data.
### Lecture 3 : Why is deep learning taking off?
* Data : Large sets of labeled data due to digitization of the economy.
* Computation : Leaps in computational power, enabling deeper networks and more hidden layers.
* Algorithms  : Faster turn around times, reducing the time-lag for iterative improvements.

## Week 2 :
### Lecture 1 : Binary classification
For implementation, the $n_x$ feature vectors are unrolled for $m$ training examples,
stored as columns, for vector X. Correspondingly y is a column vector of size  $1 \times m$.

The shape of any vector can be found by
```Python
X.shape
out : (n$_x$,m)
y.shape
out : (1,m)
```

### Lecture 2 : Logistic regression
We define logistic regression problem as for a given X, what is the probability of y to be 1.

\\[ \hat{y} \,=\,\sigma(w^T X + b) \\]