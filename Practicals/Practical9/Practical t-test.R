temp <- read.csv("OrionTemp.csv")
head(temp)
summary(temp)
mysample <- temp[sample(x = 1:103233, size = 10), 1]
t.test(x = mysample, mu = 37, alternative = "two.sided")
#plot(function(x) dt(x, df = 9), -10, 10, yaxs = "i")
plot(dt(seq(-10, 10, 0.1), 9), type = "l")
(area <- sum(dt(seq(-10, 10, 0.1), 9)*0.1))
(mean(mysample)-37)/(sd(mysample)/sqrt(10))
(area <- sum(dt(seq(-10, -0.8, 0.1), 9)*0.1)*2)

number <- c()
for (i in 1:1000) {
  p.values <- NULL
  count = 0
  for (j in 1:i) {
    mysample <- temp[sample(x = 1:103233, size = 10), 1]
    test <- t.test(x = mysample, mu = 37, alternative = "two.sided")
    p.values <- c(p.values, test$p.value)
  }
  for (k in p.values) {
    if (k<0.05) {
      count = count + 1
    }
  }
  number[i]<-count
}

plot(number)

numbers <- c()
for (l in 5:100) {
  p.values <- NULL
  count <- 0
  for (m in 1:100) {
    mysample<- temp[sample(x = 1:103233, size = l), 1]
    test <- t.test(x = mysample, mu = 37, alternative = "two.sided")
    p.values <- c(p.values, test$p.value) 
  }
  for (k in p.values) {
    if (k<0.05) {
      count = count + 1
    }
  }
  numbers[l]<- count
}

plot(numbers)
