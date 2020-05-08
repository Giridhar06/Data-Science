import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
train,test=train_test_split(glasscsv,test_size=0.2)
from sklearn.neighbors import KNeighborsClassifier as KNC
neigh =KNC(n_neighbors=3)
neigh.fit(train.iloc[:,0:9],train.iloc[:,9])
train_acc=np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])
train_acc #0.8187134502923976
test_acc=np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])
test_acc #0.7209302325581395
neigh =KNC(n_neighbors=5)
neigh.fit(train.iloc[:,0:9],train.iloc[:,9])
train_acc=np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])
train_acc # 0.7426900584795322
test_acc=np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])
test_acc #0.7441860465116279
acc=[]
for i in range(5,40,2):
 neigh =KNC(n_neighbors= i )
 neigh.fit(train.iloc[:,0:9],train.iloc[:,9])
 train_acc=np.mean(neigh.predict(train.iloc[:,0:9])==train.iloc[:,9])
 train_acc
 test_acc=np.mean(neigh.predict(test.iloc[:,0:9])==test.iloc[:,9])
 test_acc
 acc.append([train_acc,test_acc])
 import matplotlib.pyplot as plt
plt.plot(np.arange (5,40,2),[i[0]for i in acc],"ro-")
plt.plot(np.arange (5,40,2),[i[1]for i in acc],"bo-")
# by observing the graph we can say that K=7 is the best value