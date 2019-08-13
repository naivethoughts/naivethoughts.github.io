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

## 2. Categorical Variables
Categorical variables can take only certain values, for example - True or False. In this section, the ways to handle categorical variables are discussed below

* Dropping the columns with categorical variables : Similar to the idea discussed in section above

```Python
# Drop columns in training and validation data
drop_X_train = X_train.select_dtypes(exclude=['object'])
drop_X_valid = X_valid.select_dtypes(exclude=['object'])
```

* Label Encoder : Assigns unique values to encoded labels, however columns have to be dropped if the corresponding variables in training and validation data sets differ.

```Python
# All categorical columns
object_cols = [col for col in X_train.columns if X_train[col].dtype == "object"]

# Columns that can be safely label encoded
good_label_cols = [col for col in object_cols if set(X_train[col]) == set(X_valid[col])]

# Problematic columns that will be dropped from the dataset
bad_label_cols = list(set(object_cols)-set(good_label_cols))

from sklearn.preprocessing import LabelEncoder

# Drop categorical columns that will not be encoded
label_X_train = X_train.drop(bad_label_cols, axis=1)
label_X_valid = X_valid.drop(bad_label_cols, axis=1)

# Apply label encoder
label_encoder = LabelEncoder()
for col in set(good_label_cols) :
    label_X_train[col] = label_encoder.fit_transform(X_train[col])
    label_X_valid[col] = label_encoder.transform(X_valid[col])
```

* One hot encoder : Expands each categorical values and assigns 0 and 1 value to each expanded feature.

```Python
from sklearn.preprocessing import OneHotEncoder

# Apply one-hot encoder to each column with categorical data
OH_encoder = OneHotEncoder(handle_unknown='ignore', sparse=False)
OH_cols_train = pd.DataFrame(OH_encoder.fit_transform(X_train[low_cardinality_cols]))
OH_cols_valid = pd.DataFrame(OH_encoder.transform(X_valid[low_cardinality_cols]))

# One-hot encoding removed index; put it back
OH_cols_train.index = X_train.index
OH_cols_valid.index = X_valid.index

# Remove categorical columns (will replace with one-hot encoding)
num_X_train = X_train.drop(object_cols, axis=1)
num_X_valid = X_valid.drop(object_cols, axis=1)

# Add one-hot encoded columns to numerical features
OH_X_train = pd.concat([num_X_train, OH_cols_train], axis=1)
OH_X_valid = pd.concat([num_X_valid, OH_cols_valid], axis=1)
```
