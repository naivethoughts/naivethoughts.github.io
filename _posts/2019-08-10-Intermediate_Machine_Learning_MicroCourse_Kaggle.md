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
# Get names of columns with missing values
cols_with_missing = [col for col in X_train.columns if X_train[col].isnull().any()]
# Fill in the lines below: drop columns in training and validation data
reduced_X_train = X_train.drop(cols_with_missing, axis=1)
reduced_X_valid = X_valid.drop(cols_with_missing, axis=1)
```

  * Imputation : Fill the missing value with a number (mean, median, mode ?). As an extension, we can keep a track of the imputed value.

```Python
from sklearn.impute import SimpleImputer
from sklearn.ensemble import RandomForestRegressor

# Imputation
# class sklearn.impute.SimpleImputer(missing_values=nan, strategy=’mean’, fill_value=None, verbose=0, copy=True, add_indicator=False)
final_imputer = SimpleImputer(strategy="median") # strategy = mean, median, most_frequent, constant

imputed_X_train = pd.DataFrame(my_imputer.fit_transform(X_train))
imputed_X_valid = pd.DataFrame(my_imputer.transform(X_valid))

# Imputation removed column names; put them back
imputed_X_train.columns = X_train.columns
imputed_X_valid.columns = X_valid.

# Define and fit model
model = RandomForestRegressor(n_estimators=100, random_state=0)
model.fit(imputed_X_train, y_train)

# Fill in the line below: preprocess test data
final_X_test = pd.DataFrame(final_imputer.transform(X_test))

# Fill in the line below: get test predictions
preds_test = model.predict(final_X_test)
```
