---
layout: post
title: "Machine Learning Microcourse - Kaggle"
date: 2019-05-10
excerpt: "Notes on machine learning, micro - course in Kaggle"
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
#container{
import pandas as pd
filePath = '../raw_data.csv'
raw_data = pd.read_csv(filePath)
raw_data.describe()
}
