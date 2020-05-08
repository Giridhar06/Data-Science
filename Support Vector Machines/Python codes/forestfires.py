import pandas as pd
import numpy as np

data=forestfirescsv

data=data.drop(["month","day","size_category"],axis=1)
from sklearn.preprocessing import LabelEncoder
lb=LabelEncoder()
forestfirescsv["size_category"]=lb.fit_transform(forestfirescsv["size_category"])
def norm_func(i):
    x=((i-i.mean())/(i.std()))
    return(x)
df_norm=norm_func(data.iloc[:,:])

x=df_norm
y=forestfirescsv["size_category"]
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.2)
from sklearn.svm import SVC
model_linear=SVC(kernel="linear")
model_linear.fit(x_train,y_train)
pred_test_linear=model_linear.predict(x_test)
np.mean(pred_test_linear==y_test) # 98.07

model_linear=SVC(kernel="rbf")
model_linear.fit(x_train,y_train)
pred_test_linear=model_linear.predict(x_test)
np.mean(pred_test_linear==y_test) # 87.5
