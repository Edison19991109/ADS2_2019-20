population <- rnorm(1e6,100,5)
popmean <-{}
dev <-{}

for (j in 5:100) {
  for (i in 1:1000) {
    RandomPickUp<-sample(1:1e6,j)
    popmean[i] <- round(mean(population[c(RandomPickUp)]),1)
  }
  dev[j] <- sd(popmean)
}
plot(dev,xlab = "sample size", ylab = "sd of sampling distribution")