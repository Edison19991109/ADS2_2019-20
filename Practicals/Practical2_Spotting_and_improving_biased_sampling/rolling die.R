result1 <- sample(1:6, 1000, replace = TRUE)
result2 <- sample(1:6, 1000, replace = TRUE)
result <- result1+result2
hist(result)