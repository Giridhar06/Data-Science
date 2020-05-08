Airline<-read_excel(file.choose()) 
Airline <- Airline$Passengers
Airline <- as.ts(Airline)
View(Airline)
class(Airline)

Airline1 <- ts(Airline,start=c(1986,1),end=c(1995,6),frequency=4)


start(Airline1)
end(Airline1)

summary(Airline1)
sum(is.na(Airline1))
decomdata<- decompose(Airline1, "multiplicative")
plot(decomdata)
plot(decomdata$seasonal)
plot(decomdata$trend)
plot(decomdata$random)
plot(Airline1)
abline(reg=lm(Airline1~time(Airline1)))
cycle(Airline1)
boxplot(Airline1~cycle(Airline1,xlab = "Date", ylab = "Passenger Number(100's)"))

Newmodel <- auto.arima(Airline1)
Newmodel
auto.arima(Airline1, ic = "aic", trace = TRUE)
plot.ts(Newmodel$residuals)
acf(ts(Newmodel$residuals),main = 'ACF Residual')
pacf(ts(Newmodel$residuals),main = 'PACF Residual')

Pass_Forecast <- forecast(Newmodel,Level=c(95),h=10*12)
plot(Pass_Forecast)
Box.test(Newmodel$resid, lag = 5, type = "Ljung-Box")
Box.test(Newmodel$resid, lag = 10, type = "Ljung-Box")
