---
layout: post
title: "Machine Learning Microcourse - Kaggle"
date: 2019-05-10
excerpt: "Notes on machine learning microcourse from Kaggle"
tags: [Machine-Learning, Python]
comments: false
codes: true
---
Last updated : 05/10/2019

## 1. How models work ?
The accuracy of final decision (leaf) depends on capturing and comparing crucial
features/characteristics (splits based on training dataset) of the data
under examination.

## 2. Basic Data Exploration
Pandas library, is used as the primary tool to explore data.

```Python
import pandas as pd
filePath = '../raw_data.csv'
raw_data = pd.read_csv(filePath)
raw_data.describe()                             # Describe statistics of data
```

## 3. Select data for modeling
```Python
raw_data.columns                                # Describe the columns of data
raw_data.dropna(axis=0)                         # Drops the data not available
features = ['abc','def','ghi' ... 'xyz']        # Select features
X = raw_data[features]
y = raw_data['xyz']
X.describe
X.head                                          # Shows the head of the dataset
```
## Building models
```Python
from sklearn.tree import DecisionTreeRegressor  # Import scikit-learn
# Define model. Specify a number for random_state to ensure same results each run
raw_data_model = DecisionTreeRegressor(random_state=1)
raw_data_model.fit(X,y)
```

## 4. Model Validation
A simple metric to evaluate the accuracy of the predictive system is the mean absolute
error(MAE). The mean absolute error of a model on a fitted data would yield a lower
error than the actual error on a new dataset. Hence to evaluate the actual MAE,
a part of the training dataset can be kept aside as validation dataset. After training
the model on training dataset, the MAE has to be evaluated based on the validation dataset.

```Python
from sklearn.model_selection import train_test_split

# split data into training and validation data, for both features and target
# The split is based on a random number generator. Supplying a numeric value to
# the random_state argument guarantees we get the same split every time we
# run this script.
train_X, val_X, train_y, val_y = train_test_split(X, y, random_state = 0)
# Define model
raw_data_model = DecisionTreeRegressor()
# Fit model
raw_data_model.fit(train_X, train_y)

# get predicted prices on validation data
val_predictions = raw_data_model.predict(val_X)
print(mean_absolute_error(val_y, val_predictions))
```
