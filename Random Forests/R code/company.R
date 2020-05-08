data <- `Company_Data(1)`
install.packages("randomForest")
library(randomForest)
table(data$Sales)
data$ShelveLoc <- factor(data$ShelveLoc, levels = c("Bad","Good","Medium"),labels=c("0","1","2"))
data$Urban <- factor(data$Urban, levels = c("Yes","No"),labels=c("0","1"))
data$US <- factor(data$US, levels = c("Yes","No"),labels=c("0","1"))
cut(data$Sales,3,include.lowest = TRUE)
cut(data$Sales,3,include.lowest = TRUE,labels = c("Low","Medium","High"))
data1 <- cut(data$Sales,3,include.lowest = TRUE,labels = c("Low","Medium","High"))
data2 <- as.data.frame(data1)
data_final <- cbind(data2,data)
data_final <- data_final[-2]
names(data_final)[names(data_final)=="data1"] <- "Sales"
round(prop.table(table(data_final$Sales))*100,1)
summary(data_final[c("CompPrice","Income","Population")])
data_forest <- randomForest(Sales~.,data=data_final,importance=TRUE)
plot(data_forest)
acc_data_final <- mean(data_final$Sales==predict(data_forest))
acc_data_final #0.7225
varImpPlot(data_forest)
