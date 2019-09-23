population <- rnorm(1e6,100,5)
popmean <-{}
popdev <-{}
for (i in 1:1000) {
  RandomPickUp<-sample(1:1e6,100)
  popmean[i] <- round(mean(population[c(RandomPickUp)]),1)
  popdev[i] <- round(sd(population[c(RandomPickUp)]),1)
}
hist(popmean)
hist(popdev)