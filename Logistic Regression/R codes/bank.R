bank <- bank.full
summary(bank)
str(bank)
attach(bank)
colnames(bank)
logit = glm(y~age+factor(job)+factor(marital)+factor(education)+factor(default)+balance+factor(housing)+factor(loan)+factor(contact)+
              day+factor(month)+duration+campaign+pdays+previous+factor(poutcome),family = "binomial",data = bank)
summary(logit)
prob=predict(logit,type = c("response"),bank)
prob
confusion <- table(prob>0.5,bank$y)
confusion
accuracy <- sum(diag(confusion))/sum(confusion)
accuracy # 90.1%
 
rocrpred <- prediction(prob,bank$y)
rocrperf <- performance(rocrpred,'tpr','fpr')
plot(rocrperf,colorize=T,text.adj=c(-0.2,1.7)) # best cutoff value = 0.82
