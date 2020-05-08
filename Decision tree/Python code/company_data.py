import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
data=Company_Datacsv
data.head()
data['Sales'].unique()
data.Sales.mean()
labels=['low','medium','high']
bins=[0,7.49,12.10,16.27]
x=pd.DataFrame(data.Sales)
data['Sales']=pd.cut(data['Sales'],labels=labels,bins=bins)
from sklearn.preprocessing import LabelEncoder
lb=LabelEncoder()
data['ShelveLoc']=lb.fit_transform(data['ShelveLoc'])
data['Urban']=lb.fit_transform(data['Urban'])
data['US']=lb.fit_transform(data['US'])
from sklearn.model_selection import train_test_split
train,test=train_test_split(data,test_size=0.2)
from sklearn.tree import DecisionTreeClassifier
model=DecisionTreeClassifier(criterion='entropy')
colnames=list(data.columns)
colnames
predictors=colnames[1:11]
target=colnames[0]
train.isnull().sum()
train=train.dropna()
model.fit(train[predictors],train[target])
pred=model.predict(train[predictors])
pred1=model.predict(test[predictors])
pd.crosstab(pred1,test[target])
np.mean(pred1==test.Sales)#0.65
