Plastics<-read.csv(file.choose())
Plastics <- Plastics$Sales
Plastics <- as.ts(Plastics)
View(Plastics)
class(Plastics)

Plastics1 <- ts(Plastics,start=c(1986,1),end=c(1995,6),frequency=4)


start(Plastics1)
end(Plastics1)
summary(Plastics1)
sum(is.na(Plastics1))

decomdata<- decompose(Plastics1, "multiplicative")
plot(decomdata)
plot(decomdata$seasonal)
plot(decomdata$trend)
plot(decomdata$random)
plot(Plastics1)
abline(reg=lm(Plastics1~time(Plastics1)))
cycle(Plastics1)
boxplot(Plastics1~cycle(Plastics1,xlab = "Date", ylab = "Passenger Number(100's)",
                        main = "Monthly Boxplot of passengers from 1995 to 2002"))

Newmodel <- auto.arima(Plastics1)
Newmodel
auto.arima(Plastics1, ic = "aic", trace = TRUE)
plot.ts(Newmodel$residuals)
acf(ts(Newmodel$residuals),main = 'ACF Residual')
pacf(ts(Newmodel$residuals),main = 'PACF Residual')

Pass_Forecast <- forecast(Newmodel,Level=c(95),h=10*12)
plot(Pass_Forecast)
Box.test(Newmodel$resid, lag = 5, type = "Ljung-Box")
Box.test(Newmodel$resid, lag = 10, type = "Ljung-Box")