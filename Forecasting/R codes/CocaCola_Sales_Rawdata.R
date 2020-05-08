Cocacola<-read_excel(file.choose()) 
Cocacola <- Cocacola$Sales
Cocacola <- as.ts(Cocacola)
View(Cocacola)
class(Cocacola)

Cocacola1 <- ts(Cocacola,start=c(1986,1),end=c(1995,6),frequency=4)


start(Cocacola1)
end(Cocacola1)

summary(Cocacola1)
sum(is.na(Cocacola1))
decomdata<- decompose(Cocacola1, "multiplicative")
plot(decomdata)
plot(decomdata$seasonal)
plot(decomdata$trend)
plot(decomdata$random)
plot(Cocacola1)
abline(reg=lm(Cocacola1~time(Cocacola1)))
cycle(Cocacola1)
boxplot(Cocacola1~cycle(Cocacola1,xlab = "Date", ylab = "Passenger Number(100's)"))

Newmodel <- auto.arima(Cocacola1)
Newmodel
auto.arima(Cocacola1, ic = "aic", trace = TRUE)
plot.ts(Newmodel$residuals)
acf(ts(Newmodel$residuals),main = 'ACF Residual')
pacf(ts(Newmodel$residuals),main = 'PACF Residual')

Pass_Forecast <- forecast(Newmodel,Level=c(95),h=10*12)
plot(Pass_Forecast)
Box.test(Newmodel$resid, lag = 5, type = "Ljung-Box")
Box.test(Newmodel$resid, lag = 10, type = "Ljung-Box")
