install.packages("lattice")
dotchart(emp_data$Salary_hike)
dotchart(emp_data$Churn_out_rate)
boxplot(emp_data$Salary_hike)
boxplot(emp_data$Churn_out_rate)
hist(emp_data$Salary_hike)
hist(emp_data$Churn_out_rate)
qqnorm(emp_data$Salary_hike)
qqline(emp_data$Salary_hike)
qqnorm(emp_data$Churn_out_rate)
qqline(emp_data$Churn_out_rate)
plot(emp_data$Salary_hike,emp_data$Churn_out_rate,pch=20)
cor(emp_data$Salary_hike,emp_data$Churn_out_rate)
reg<-lm(emp_data$Salary_hike~emp_data$Churn_out_rate,data = emp_data)
summary(reg)
confint(reg,level = 0.95)
pred<-predict(reg,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)


#Applying Transformation
#Applying sqrt


reg_sqrt<-lm(emp_data$Salary_hike~sqrt(emp_data$Churn_out_rate),data = emp_data)
summary(reg_sqrt)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)


#Applying Transformation
#Applying log

reg_log<-lm(emp_data$Salary_hike~log(emp_data$Churn_out_rate),data = emp_data)
summary(reg_log)
confint(reg_log,level = 0.95)
pred<-predict(reg_log,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)

#Applying Trasformation
#Applying sqrt

reg_sqrt<-lm(sqrt(emp_data$Salary_hike)~emp_data$Churn_out_rate,data = emp_data)
summary(reg_sqrt)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)

#Applying Trasformation
#Applying log

reg_log<-lm(log(emp_data$Salary_hike)~emp_data$Churn_out_rate,data = emp_data)
summary(reg_log)
confint(reg_log,level = 0.95)
pred<-predict(reg_log,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)

#Applying Trasformation
#Applying Exponential

reg_exp<-lm(emp_data$Salary_hike~exp(emp_data$Churn_out_rate),data = emp_data)
summary(reg_exp)
confint(reg_exp,level = 0.95)
pred<-predict(reg_exp,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)

#Applying Trasformation
#Applying Exponential

reg_exp<-lm(exp(emp_data$Salary_hike)~emp_data$Churn_out_rate,data = emp_data)
summary(reg_exp)
confint(reg_exp,level = 0.95)
pred<-predict(reg_exp,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)


#Applying Transformation
#Applying squre

reg_sq<-lm(emp_data$Salary_hike~(emp_data$Churn_out_rate)^2,data = emp_data)
summary(reg_sq)
confint(reg_sq,level = 0.95)
pred<-predict(reg_sq,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)

#Applying Transformation
#Applying squre

reg_sq<-lm((emp_data$Salary_hike)^2~emp_data$Churn_out_rate,data = emp_data)
summary(reg_sq)
confint(reg_sq,level = 0.95)
pred<-predict(reg_sq,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,emp_data$Salary_hike)
