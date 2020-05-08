data=concretecsv
import pandas as pd
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from sklearn.model_selection import train_test_split
str(data)
data.describe()
def norm_func(i):
    x=((i-i.mean())/(i.std()))
    return(x)
df_norm=norm_func(data.iloc[:,1:])    
df_norm.describe()
x=data.drop(["strength"],axis=1)
y=data["strength"]
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3)
cont_model=Sequential()
cont_model.add(Dense(50,input_dim=8,activation="relu"))
cont_model.add(Dense(1,kernel_initializer="normal"))
cont_model.compile(loss="mean_squared_error",optimizer="adam",metrics=["mse"])
model=cont_model
model.fit(np.array(x_train),np.array(y_train),epochs=10)
pred=model.predict(np.array(x_test))
pred=pd.Series([i[0] for i in pred])
pred_1=model.predict(np.array(x_train))
pred_1=pd.Series([i[0] for i in pred_1])

np.corrcoef(pred,y_test) # 77.52
np.corrcoef(pred_1,y_train) # 80.25
