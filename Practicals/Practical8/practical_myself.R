rank1 <- c()
meanVec <- replicate(10000, mean(runif(n = 26, min = 0, max = 100)))
counts <- length(which(meanVec < 40))

# for (i in 1:10000) {
#   class1 <- runif(n = 26, min = 0, max = 100)
#   mean1 <- mean(class1)
#   rank1[i] <- mean1
# }
# count <- 0
# for (i in 1:10000) {
#   if (rank1[i] <= 40){
#     count = count + 1
#   }
# }

p26 <- counts/10000
mean <- replicate(10000, mean(runif(n = 5, min = 0, max = 100)))
count <- length(which(mean < 40))
p5 <- count/10000
hist(mean, xlim = c(0,100), ylim = c(0,1500), col = "green", breaks = 20)
par(new=TRUE)
hist(meanVec, xlim = c(0,100), ylim = c(0,1500), col = "red", breaks = 20)

meanVec2 <- replicate(10000, mean(runif(n = 26, min = 0, max = 80)))
hist(meanVec2)
count2 <- length(which(meanVec<meanVec2))
probability <- count2/10000

compare <- c()
Leonie <- c(64, 63, 62, 59)
Sheldon <- c(70, 63, 61, 56)
for (i in 1:100) {
  count_Leonie <- c()
  count_Sheldon <- c()
  for (j in 1:4) {
    count_Leonie[j] <- pnorm(q = Leonie[j], mean = 50, sd = 10)*100
  }
  mean_leonie <- mean(count_Leonie)
  
  for (k in 1:4) {
    count_Sheldon[k] <- pnorm(q = Sheldon[k], mean = 50, sd = 10)*100
  }
  mean_sheldon <- mean(count_Sheldon)
  compare[i] <- length(which(mean_leonie>mean_sheldon))
}

possiblility <-  sum(compare)/100

unlucky_class <- pnorm(q = rnorm(n = 26, mean = 40, sd = 8), mean = 50, sd = 10)
unlucky_class <- unlucky_class*100
unlucky_class <- mean(unlucky_class)
count <- 0
for (i in 1:10000) {
  class_number <- runif(n = 1, min = 5, max = 40)
  class_other <- pnorm(q = rnorm(n = class_number, mean = 50, sd = 10), mean = 50, sd = 10)
  class_other <- class_other*100
  class_other <- mean(class_other)
  if (unlucky_class > class_other) {
    count <- count+1
  }
}
pro <- count/10000
# hist(unlucky_class)
