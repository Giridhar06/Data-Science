install.packages("lattice")
dotchart(delivery_time$Delivery.Time)
dotchart(delivery_time$Sorting.Time)
boxplot(delivery_time$Delivery.Time)
boxplot(delivery_time$Sorting.Time)
hist(delivery_time$Delivery.Time)
hist(delivery_time$Sorting.Time)
qqnorm(delivery_time$Delivery.Time)
qqline(delivery_time$Delivery.Time)
qqnorm(delivery_time$Sorting.Time)
qqline(delivery_time$Sorting.Time)
plot(delivery_time$Sorting.Time,delivery_time$Delivery.Time,pch=20)
cor(delivery_time$Sorting.Time,delivery_time$Delivery.Time)
reg<-lm(delivery_time$Sorting.Time~delivery_time$Delivery.Time,data = delivery_time)
summary(reg)
confint(reg,level = 0.95)
pred<-predict(reg,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)


#Applying Transformation
#Applying sqrt


reg_sqrt<-lm(delivery_time$Sorting.Time~sqrt(delivery_time$Delivery.Time),data = delivery_time)
summary(reg_sqrt)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)


#Applying Transformation
#Applying log

reg_log<-lm(delivery_time$Sorting.Time~log(delivery_time$Delivery.Time),data = delivery_time)
summary(reg_log)
confint(reg_log,level = 0.95)
pred<-predict(reg_log,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)

#Applying Trasformation
#Applying sqrt

reg_sqrt<-lm(sqrt(delivery_time$Sorting.Time)~delivery_time$Delivery.Time,data = delivery_time)
summary(reg_sqrt)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)

#Applying Trasformation
#Applying log

reg_log<-lm(log(delivery_time$Sorting.Time)~delivery_time$Delivery.Time,data = delivery_time)
summary(reg_log)
confint(reg_log,level = 0.95)
pred<-predict(reg_log,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)

#Applying Trasformation
#Applying Exponential

reg_exp<-lm(delivery_time$Sorting.Time~exp(delivery_time$Delivery.Time),data = delivery_time)
summary(reg_exp)
confint(reg_exp,level = 0.95)
pred<-predict(reg_exp,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)

#Applying Trasformation
#Applying Exponential

reg_exp<-lm(exp(delivery_time$Sorting.Time)~delivery_time$Delivery.Time,data = delivery_time)
summary(reg_exp)
confint(reg_exp,level = 0.95)
pred<-predict(reg_exp,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)


#Applying Transformation
#Applying squre

reg_sq<-lm(delivery_time$Sorting.Time~(delivery_time$Delivery.Time)^2,data = delivery_time)
summary(reg_sq)
confint(reg_sq,level = 0.95)
pred<-predict(reg_sq,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)

#Applying Transformation
#Applying squre

reg_sq<-lm((delivery_time$Sorting.Time)^2~delivery_time$Delivery.Time,data = delivery_time)
summary(reg_sq)
confint(reg_sq,level = 0.95)
pred<-predict(reg_sq,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,delivery_time$Sorting.Time)
