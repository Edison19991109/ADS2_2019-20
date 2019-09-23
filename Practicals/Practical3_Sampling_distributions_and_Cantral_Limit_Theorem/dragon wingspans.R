dragon <- read.csv('C:\\Users\\KANG Jianning\\Documents\\GitKraken\\ADS2_2019-20\\Practicals\\Practical3_Sampling_distributions_and_Cantral_Limit_Theorem\\dragons.csv')
hist(dragon$wingspan)
mean <- {}
for (i in 1:1000) {
  Randomchoose <- sample(500,100)
  mean[i] <- round(mean(dragon$wingspan[c(Randomchoose)]),1)
}
hist(mean)