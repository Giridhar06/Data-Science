import pandas as pd
import numpy as np

fraud=pd.read_csv("E:/datasets/DT/Fraud_check.csv")
fraud=Fraud_checkcsv
fraud=fraud.iloc[:,[0,1,3,4,5,2]]
fraud.rename(columns={'Marital.Status':'Marital_status','Taxable.Income':'Taxable_Income','City.Population':'City_Population','Work.Experience':'Work_Experience'},inplace=True)

colnames=list(fraud.columns)
predictors=colnames[:5]
target=colnames[5]
labels=['risky','good']
bins=[10003,30000,99619]
fraud['Taxable_Income']=pd.cut(fraud['Taxable_Income'],labels=labels,bins=bins)

from sklearn.preprocessing import LabelEncoder
lb=LabelEncoder()
fraud["Undergrad"] = lb.fit_transform(fraud["Undergrad"])
fraud["Marital_status"] = lb.fit_transform(fraud["Marital_status"])
fraud["Urban"] = lb.fit_transform(fraud["Urban"])


from sklearn.model_selection import train_test_split
train,test=train_test_split(fraud,test_size=0.2)
train.isnull().sum()
train=train.dropna()
from sklearn.tree import DecisionTreeClassifier as DT
model=DT(criterion="entropy")
model.fit(train[predictors],train[target])
model.fit(test[predictors],test[target])
pred=model.predict(train[predictors])
pred1=model.predict(test[predictors])
pd.crosstab(train[target],pred,rownames=["ACTUAL"],colnames=["PREDICTIONS"])
pd.crosstab(test[target],pred1,rownames=["ACTUAL"],colnames=["PREDICTIONS"])
np.mean(pred==train[target])#0.6617954070981211
np.mean(pred1==test[target])#1.0
