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
For implementation, the \\( n_x \\) feature vectors are unrolled for \\( m \\) training examples,
stored as columns, for vector X. Correspondingly y is a column vector of size  \\( 1 \times m \\).

The shape of any vector can be found by
```Python
X.shape
```
out : (\\(n_x\\),m)
```Python
y.shape
```
out : (1,m)

### Lecture 2 : Logistic regression
We define logistic regression problem as for a given X, what is the probability of y to be 1.
\\[ \hat{y} \,=\,\sigma(w^T x + b) \\]

here,
\\( \sigma(z) \\) is the sigmoid function given by
\\[ \sigma(z)\,=\,\frac{1}{1+exp(-z)} \\]

b can be thought of as \\( \theta_0 \\), similar to ML course. Unlike ML, b is treated separately.

### Lecture 3 : Logistic regression : Cost function
To reach a global minima, the logistic regression uses a loss function for a single training example of the form,

\\[ \mathcal{L}(\hat{y},y)\,=\, -(y\,log(\hat{y})\,+\,(1-y)\,log(1-\hat{y}))\\]

with \\(0\,\le\,y,\hat{y}\,\le\,1\\). For y = 1, the loss function becomes
\\(\mathcal{L}(\hat{y},1)\,=\,log(\hat{y})\\) reducing to 0 as \\(\hat{y}\,\to\,1\\).

The cost function, to be minimized, is the average of loss function across all the training examples
given by,

\\[ J(w,b)\,=\,-\frac{1}{m}\,\sum_{i=1}^m\,\mathcal{L}(\hat{y}^i,y^i) \\]

If we define \\( \hat{y}\,=\,P(y=1|x) \\), that is \\( \hat{y} \\) is the probability that y = 1 for given features x. or
\\[ P(y=1|x)\,=\,\hat{y} \\]
\\[ P(y=0|x)]\,=\,1\,-\,\hat{y} \\]
This can be succinctly written as,
\\[ P(y|x)\,=\,\hat{y}^{y}(1-\hat{y})^{1-y} \\]
Taking a log on either side, would yield the cost function. The negative sign comes from the principle of maximum likelihood estimation and the scaling of \\(1/m\\) is multiplied for better convergence.

### Lecture 4 : Gradient Descent

In order to minimize the cost function \\( J(w,b) \\), gradient descent algorithm is used. To determine the direction of the
next update of \\( w \\),

\\[ w\,=\,w\,-\,\alpha\frac{\partial J}{\partial w} \\]

the above update is applied repeatedly till the value of \\( w \\) converges.

### Lecture 9 : Logistic Regression : Gradient descent

\\[ \mathcal{L}(a,y)\,=\, -(y\,log(a)\,+\,(1-y)\,log(1-a))\\]

Derivative with respect to a, would be

\\[ \frac{\partial \mathcal{L}}{\partial a}\,=\,\frac{-y}{a}\,+\,\frac{1-y}{1-a}\\]

Shows the change in loss function with respect to \\( \hat{y} \\) or \\( a \\). Now let us look into the derivative of z,

\\[ \frac{\partial a}{\partial z}\,=\,\frac{exp(-z)}{(1+exp(-z))^2}\\]
\\[ \frac{\partial a}{\partial z}\,=\,a\times(1-a)\\]

Therefore \\(dz\,=\,\frac{\partial \mathcal{L}}{\partial a}\frac{\partial a}{\partial z}\\),

\\[dz\,=\,a\,-\,y\\]

and the variables are updated as

\\[ w_i\,=\,w_i\,-\,\alpha\,x_i\, dz\\]
\\[ b_i\,=\,b_i\,-\,\alpha\,dz\\]

### Lecture 10, 15 : Logistic Regression : Gradient descent for m training examples

The vectorized implementation for logstic regression problem with m training examples is described below.

```Python
import numpy as np

for iter in range(1000) :
  Z = np.dot(w.T,X) + b
  A = sigmoid(Z)
  dZ = A - Y
  dW = (X*dZ.T)/m
  dB = np.sum(dZ)/m
  W = W - alpha*dW
  B = B - alpha*dB
```

### Lecture 11, 12, 13, 14 Vectorization, Broadcasting, Python/Numpy Vectors

* Avoid for loops, and whenever possible vectorize the code to take advantage of efficient parallelization of the language for CPUs and GPUs.
* Numpy has mathematical functions that can help in vectorization of the code.
* Broadcasting, works analogously to bsxfun in matlab and octave. For any addition, subtraction, multiplication and division operation of an (m,n) matrix with a second matrix, the second matrix is copied in m rows if the matrix is of the size (1,n) and n columns if the second matrix is of the size (m,1). Thus the second matrix is of the size (m,n) and the operation is performed.
* For easy readability and less bugs, assertain the size of matrix being operated on.
* Ensure the variable is a matrix not a rank 1 array.

## Week 3 :

### Lecture 1 - 10 Neural Network Basics

<figure>
	<img src="{{ site.url }}//_posts/images/Neural_Network.png">
	<figcaption>Neural network representation</figcaption>
</figure>

The figure above represents a shallow neural network of three layers, with two hidden layers and one output layer.
