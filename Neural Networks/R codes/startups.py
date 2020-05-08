data = Startups1csv
import pandas as pd
import numpy as np
data= data.drop(["State"],axis=1)
x=data.drop(["Profit"],axis=1)
y=data["Profit"]
from keras.models import Sequential
from keras.layers import Dense
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.2)
cont_model=Sequential()
cont_model.add(Dense(50,input_dim=3,activation="relu"))
cont_model.add(Dense(1,kernel_initializer="normal"))
cont_model.compile(loss="mean_squared_error",optimizer="adam",metrics=["mse"])
model=cont_model
model.fit(np.array(x_train),np.array(y_train),epochs=10)
pred=model.predict(np.array(x_test))
pred=pd.Series([i[0] for i in pred])

pred_1=model.predict(np.array(x_train))
pred_1=pd.Series([i[0] for i in pred_1])

np.corrcoef(pred,y_test) # 65.79
np.corrcoef(pred_1,y_train) #69.99



