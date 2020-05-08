Zoo <- Zoo[-1]
table(Zoo$type)
round(prop.table(table(Zoo$type))*100,digits = 1)
str(Zoo)
summary(Zoo[c("hair","feathers","eggs")])
Zoo_train <- Zoo[1:91,]
Zoo_test <- Zoo[92:101,]
Zoo_train_lables <- Zoo[1:91,17]
Zoo_test_lables <- Zoo[92:101,17]
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=9)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=5)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=11)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=17)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=3)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=13)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=19)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=8)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
Zoo_test_pred <- knn(train = Zoo_train,test = Zoo_test,cl=Zoo_train_lables,k=6)
CrossTable(x=Zoo_test_lables,y=Zoo_test_pred,prop.chisq = FALSE)
