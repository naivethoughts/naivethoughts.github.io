---
layout: post
title: "Intermediate Machine Learning Microcourse - Kaggle"
date: 2019-05-10
excerpt: "Notes on intermediate machine learning microcourse from Kaggle"
tags: [Machine-Learning, Python, scikit-learn]
comments: false
codes: true
---
Last updated : 08/10/2019

## 1. Missing Values
The processing of raw data is necessary to ensure the model is trained properly, one of the common problems is the absence of data in certain fields. This section addresses various methods to address the absent data.
  * Dropping the column : Dropping column corresponding to absent fields. Furthermore, dropping fields can yield a poorly trained model since one might have dropped a feature that might be crucial for a well trained model.
    ```Python
    # Fill in the line below: get names of columns with missing values
      cols_with_missing = [col for col in X_train.columns if X_train[col].isnull().any()]

    # Fill in the lines below: drop columns in training and validation data
      reduced_X_train = X_train.drop(cols_with_missing, axis=1)
      reduced_X_valid = X_valid.drop(cols_with_missing, axis=1)
    ```
  *
