table(glass$Type)
str(glass)
summary(glass[c("RI","Na","Mg")])
normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
glass_n <- as.data.frame(lapply(glass[1:10],normalize))
summary(glass_n$RI)
summary(glass_n$Na)

glass_train <- glass_n[1:164,]
glass_test <- glass_n[165:214,]
glass_train_lables <- glass[1:164,10]
glass_test_lables <- glass[165:214,10]
glass_test_pred <- knn(train = glass_train,test = glass_test,cl=glass_train_lables,k=5)
CrossTable(x=glass_test_lables,y=glass_test_pred,prop.chisq = FALSE)
glass_test_pred <- knn(train = glass_train,test = glass_test,cl=glass_train_lables,k=3)
CrossTable(x=glass_test_lables,y=glass_test_pred,prop.chisq = FALSE)
glass_test_pred <- knn(train = glass_train,test = glass_test,cl=glass_train_lables,k=7)
CrossTable(x=glass_test_lables,y=glass_test_pred,prop.chisq = FALSE)
glass_test_pred <- knn(train = glass_train,test = glass_test,cl=glass_train_lables,k=1)
CrossTable(x=glass_test_lables,y=glass_test_pred,prop.chisq = FALSE)
