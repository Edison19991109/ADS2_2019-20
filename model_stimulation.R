my_data <- read.csv("data1.csv",header=TRUE)
my_data <- my_data[complete.cases(my_data),]
plot(my_data)
my_max <- 14
my_EC50<- 3e-8
fitmodel <- nls(Y~(Max * 10^X/(EC50 + 10^X)), data=my_data, start=list(Max = my_max, EC50=my_EC50))
params <- coef(fitmodel)
Max <- params[1] 
EC50 <- params[2]
X2 <- seq(-9,-5, 0.01)
Y2 <- Max * 10^X2/(EC50 + 10^X2)
plot(Y2~X2, type="l", ylim=c(0,100), xlab="X", ylab="Y", col="violetred")
points(Y~X, data=my_data)
