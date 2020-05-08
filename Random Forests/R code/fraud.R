data <- `Fraud_check(1)`
install.packages("randomForest")
library(randomForest)
data$Undergrad <- factor(data$Undergrad,levels = c("YES","NO"),labels = c("1","0"))
data$Marital.Status <- factor(data$Marital.Status ,levels = c("Single","Married","Divorced"),labels = c("0","1","2"))
data$Urban <- factor(data$Urban,levels = c("YES","NO"),labels = c("1","0"))
min(data$Taxable.Income)
max(data$Taxable.Income)
mean(data$Taxable.Income)
cut(data$Taxable.Income ,c(10003,30000,99619),include.lowest = TRUE)
cut(data$Taxable.Income ,c(10003,30000,99619),include.lowest = TRUE,labels = c("Risky","Good"))
data1 <- cut(data$Taxable.Income ,c(10003,30000,99619),include.lowest = TRUE,labels = c("Risky","Good"))
data2 <- as.data.frame(data1)
final_data <- cbind(data2,data)
final_data<- final_data[-4]
names(final_data)[names(final_data)=="data1"] <- "Taxable_income"
round(prop.table(table(final_data$Taxable_income ))*100,1)
summary(final_data [c("Undergrad","Urban","City.Population")])
data_forest <- randomForest(Taxable_income~.,data=final_data,importance=TRUE)
plot(data_forest)
acc_final_data <- mean(final_data$Taxable_income ==predict(data_forest))
acc_final_data #acc= 0.785
varImpPlot(data_forest)
