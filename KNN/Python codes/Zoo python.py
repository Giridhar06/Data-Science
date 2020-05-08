import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
train,test=train_test_split(Zoocsv,test_size=0.2)
from sklearn.neighbors import KNeighborsClassifier as KNC
neigh =KNC(n_neighbors=3)
neigh.fit(train.iloc[:,1:17],train.iloc[:,17])
train_acc=np.mean(neigh.predict(train.iloc[:,1:17])==train.iloc[:,17])
train_acc #0.9625
test_acc=np.mean(neigh.predict(test.iloc[:,1:17])==test.iloc[:,17])
test_acc #0.9523809523809523
neigh =KNC(n_neighbors=5)
neigh.fit(train.iloc[:,1:17],train.iloc[:,17])
train_acc=np.mean(neigh.predict(train.iloc[:,1:17])==train.iloc[:,17])
train_acc #0.925
test_acc=np.mean(neigh.predict(test.iloc[:,1:17])==test.iloc[:,17])
test_acc #0.8571428571428571
acc=[]
for i in range(5,40,2):
 neigh =KNC(n_neighbors= i )
 neigh.fit(train.iloc[:,1:17],train.iloc[:,17])
 train_acc=np.mean(neigh.predict(train.iloc[:,1:17])==train.iloc[:,17])
 train_acc
 test_acc=np.mean(neigh.predict(test.iloc[:,1:17])==test.iloc[:,17])
 test_acc
 acc.append([train_acc,test_acc])
 import matplotlib.pyplot as plt
plt.plot(np.arange (5,40,2),[i[0]for i in acc],"ro-")
plt.plot(np.arange (5,40,2),[i[1]for i in acc],"bo-")
# by observing from the graph we can say that K = 10-20 is the best value 