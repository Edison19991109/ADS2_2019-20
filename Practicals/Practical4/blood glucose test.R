ND100 <- rnorm(100, 143, 48)
TW100 <- rnorm(100, 143, 48)
ND10000 <- rnorm(10000, 143, 48)
TW10000 <- rnorm(10000, 156, 55)
dat1 <- data.frame(patient = 1:100, ND100, TW100)

summary(dat1)
hist(dat1$ND100)

dat2 <- data.frame(patient= 1:10000, ND10000, TW10000, age = sample(x = 18:80, size = 10000,replace = TRUE), gender = sample(x = c('male','female'), size = 10000, replace = TRUE))
dat2

set.seed(1)
res <- t.test(ND100,TW100,paired = TRUE)
res$p.value
t.test(ND10000,TW10000, paired = TRUE)$p.value
library(ggplot2)
age <- as.factor(dat2$age)
ggplot2::ggplot(data = dat2, aes(x = age, y = ND10000))+geom_boxplot()
summary(dat2)

library('truncnorm')
ND = rtruncnorm(100, 0, 500)