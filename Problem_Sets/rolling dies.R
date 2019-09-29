r1 <- sample(1:6,1000,replace = TRUE)
r2 <- sample(1:6,1000,replace = TRUE)
r3 <- sample(1:6, 1000, replace = TRUE)
r4 <- sample(1:6, 1000, replace = TRUE)
r5 <- sample(1:6, 1000, replace = TRUE)
r <- r1 + r2 +r3+r4
hist(r)