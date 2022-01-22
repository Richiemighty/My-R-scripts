library(ARDL)
library(xts)
library(astsa)
library(stats)
library(foreign)
library(tseries)
library(abind)
library(dLagM)

attach(TURKEY)
summary(TURKEY)

#######   ARDL MODEL BEST ORDER #####
me<-ARDL::auto_ardl(GDP~Trade + consumption + Urban, data=TURKEY, max_order = 5)
me
summary(me)


####### ARDL MODEL  ########
my<-ARDL::ardl(GDP~Trade + consumption + Urban, data=TURKEY, order=c(5,5,5,5))
summary(my)


########  ECM ESTIMATION ########
uecm4555<-uecm(my)
uecm4555
summary(uecm4555)

recm4555<-recm(my, case=2)
summary(recm4555)


########  BOND TEST ######
m<-ARDL::bounds_f_test(my, case = 3)
m

####### UNIT ROOT TEST  ##########
adf.test(GDP)
adf.test(Trade)
adf.test(consumption)
adf.test(Urban)

pp.test(GDP)
pp.test(Trade)
pp.test(consumption)
pp.test(Urban)

######### NORMALITY TEST  ##########
tseries::jarque.bera.test(GDP)
tseries::jarque.bera.test(Trade)
tseries::jarque.bera.test(consumption)
tseries::jarque.bera.test(Urban)

####### FORECASTING ACCURACY  #######
library(forecast)
forecast::accuracy(my)
forecast::accuracy(uecm4555)
forecast::accuracy(recm4555)

forecast::CV(my)
forecast::CV(uecm4555)
forecast::CV(recm4555)


######### PREDICTION PLOT #######
par(mfrow=c(2,1))
plot(my$fitted.values, col="red", main="Predictive plot for Actual GDP", xlab="time",ylab="GDP")
lines(TURKEY$GDP, col="green")

plot(recm4555$fitted.values, col="red", main="Predictive plot for Differenced GDP", xlab="time",ylab="GDP")
lines(diff(TURKEY$GDP), col="green")


