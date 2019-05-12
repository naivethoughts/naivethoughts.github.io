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
raw_data_model.fit(X,y)
```
