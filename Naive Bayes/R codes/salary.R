train <- SalaryData_Train 
test <- SalaryData_Test  
str(train)
str(train)
train$educationno<-as.factor(train$educationno)
class(train)

str(test)
test$educationno<-as.factor(test$educationno)

##visualization
ggplot(data=train,aes(x=train$Salary, y = train$age, fill = train$Salary)) +
  geom_boxplot() +
  ggtitle("Box Plot")

## age from 25- 45 has <50k salary and age 35 and above has salary>50 k 

plot(train$workclass,train$Salary)
plot(train$education,train$Salary)
plot(train$maritalstatus,train$Salary)
plot(train$educationno,train$Salary)
plot(train$occupation,train$Salary)
plot(train$relationship,train$Salary)
plot(train$race,train$Salary)
plot(train$sex,train$Salary)
plot(train$hoursperweek,train$Salary)

##model 
Model <- naiveBayes(train$Salary ~ ., data = train)
Model



Model_pred <- predict(Model,test)
mean(Model_pred==test$Salary)


confusionMatrix(Model_pred,test$Salary)
accuracy= mean(Model_pred==test$Salary)
