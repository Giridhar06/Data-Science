install.packages("lattice")
dotchart(Salary_Data$YearsExperience)
dotchart(Salary_Data$Salary)
boxplot(Salary_Data$YearsExperience)
boxplot(Salary_Data$Salary)
hist(Salary_Data$YearsExperience)
hist(Salary_Data$Salary)
qqnorm(Salary_Data$YearsExperience)
qqline(Salary_Data$YearsExperience)
qqnorm(Salary_Data$Salary)
qqline(Salary_Data$Salary)
plot(Salary_Data$YearsExperience,Salary_Data$Salary,pch=20)
cor(Salary_Data$YearsExperience,Salary_Data$Salary)
reg<-lm(Salary_Data$YearsExperience~Salary_Data$Salary,data = Salary_Data)
summary(reg)
confint(reg,level = 0.95)
pred<-predict(reg,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,Salary_Data$YearsExperience)


#Applying Transformation
#Applying sqrt


reg_sqrt<-lm(Salary_Data$YearsExperience~sqrt(Salary_Data$Salary),data = Salary_Data)
summary(reg_sqrt)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,Salary_Data$YearsExperience)


#Applying Transformation
#Applying log

reg_log<-lm(Salary_Data$YearsExperience~log(Salary_Data$Salary),data = Salary_Data)
summary(reg_log)
confint(reg_log,level = 0.95)
pred<-predict(reg_log,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,Salary_Data$YearsExperience)

