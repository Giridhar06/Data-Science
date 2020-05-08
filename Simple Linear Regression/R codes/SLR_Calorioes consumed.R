install.packages("lattice")
dotchart(calories_consumed$Weight.gained..grams.)
dotchart(calories_consumed$Calories.Consumed)
boxplot(calories_consumed$Weight.gained..grams.)
boxplot(calories_consumed$Calories.Consumed)
hist(calories_consumed$Weight.gained..grams.)
hist(calories_consumed$Calories.Consumed)
qqnorm(calories_consumed$Weight.gained..grams.)
qqline(calories_consumed$Weight.gained..grams.)
qqnorm(calories_consumed$Calories.Consumed)
qqline(calories_consumed$Calories.Consumed)
plot(calories_consumed$Calories.Consumed,calories_consumed$Weight.gained..grams.,pch=20)
cor(calories_consumed$Weight.gained..grams.,calories_consumed$Calories.Consumed)
reg<-lm(calories_consumed$Calories.Consumed~calories_consumed$Weight.gained..grams.,data = calories_consumed)
summary(reg)
confint(reg,level = 0.95)
pred<-predict(reg,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,calories_consumed$Calories.Consumed)


#Applying Transformation
#Applying sqrt


reg_sqrt<-lm(calories_consumed$Weight.gained..grams.~sqrt(calories_consumed$Calories.Consumed),data = calories_consumed)
summary(reg_sqrt)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,calories_consumed$Calories.Consumed)


#Applying Transformation
#Applying log

reg_log<-lm(calories_consumed$Weight.gained..grams.~log(calories_consumed$Calories.Consumed),data = calories_consumed)
summary(reg_log)
confint(reg_sqrt,level = 0.95)
pred<-predict(reg_sqrt,interval = "predict")
pred<-as.data.frame(pred)
cor(pred$fit,calories_consumed$Calories.Consumed)
