# -*- coding: utf-8 -*-
"""
Created on Thu Oct 24 13:02:59 2019

@author: sanjay
"""

import pandas as pd
import numpy as np
salary_train=pd.read_csv('file:///G:/data/assignements/SVM/SalaryData_Train.csv')
salary_test=pd.read_csv('file:///G:/data/assignements/SVM/SalaryData_Test.csv')
string_columns=["workclass","education","maritalstatus","occupation","relationship","race","sex","native"]
for i in string_columns:
    salary_train[i] = lb.fit_transform(salary_train[i])
    salary_test[i] = lb.fit_transform(salary_test[i])
from sklearn.preprocessing import LabelEncoder
lb=LabelEncoder()
salary_test["Salary"]=lb.fit_transform(salary_test["Salary"])
salary_train["Salary"]=lb.fit_transform(salary_train["Salary"])

from sklearn.svm import SVC
train_x=salary_train.iloc[:,0:13]
train_y=salary_train.iloc[:,13]
test_x=salary_test.iloc[:,0:13]
test_y=salary_test.iloc[:,13]

#linear
model_linear=SVC(kernel="linear")
model_linear.fit(train_x,train_y)
pred_test_linear=model_linear.predict(test_x)

np.mean(pred_test_linear==test_y) # Accuracy = 82.03

# Kernel = poly
model_poly = SVC(kernel = "poly")
model_poly.fit(train_X,train_y)
pred_test_poly = model_poly.predict(test_X)

np.mean(pred_test_poly==test_y) # Accuracy = 80.42

# kernel = rbf
model_rbf = SVC(kernel = "rbf")
model_rbf.fit(train_X,train_y)
pred_test_rbf = model_rbf.predict(test_X)

np.mean(pred_test_rbf==test_y) # Accuracy = 85.44


# kernel = sigmoid
model_sig = SVC(kernel = "sigmoid")
model_sig.fit(train_X,train_y)
pred_test_sig = model_sig.predict(test_X)

np.mean(pred_test_sig==test_y) # Accuracy = 75.43

'''
# Kernel rbf model is giving high accuraccy.
