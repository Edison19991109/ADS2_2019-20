1.96*385/100

((1.96+0.84)/(0.25/0.42))^2*2
power.t.test(delta = 0.25, sd = 0.42, sig.level = 0.05, power = 0.8, type = 'two.sample', alternative = 'two.sided')

power.t.test(delta = 0.4,n = 20, sd = 0.5, sig.level = 0.05, type = 'two.sample', alternative = 'two.sided')
power.t.test(delta = 0.4,n = 20, sd = 0.5, sig.level = 0.1, type = 'two.sample', alternative = 'two.sided')
power.t.test(delta = 0.4,n = 10, sd = 0.5, sig.level = 0.05, type = 'two.sample', alternative = 'two.sided')
power.t.test(delta = 0.8,n = 20, sd = 0.5, sig.level = 0.05, type = 'two.sample', alternative = 'two.sided')



###Question 4
A <- rnorm(n = 1000, mean = 10, sd = 5)
B <- rnorm(n = 1000, mean = 11, sd = 5)
SampleA <- sample(x = A, size = 5, replace = FALSE)
SampleB <- sample(x = B, size = 5, replace = FALSE)
t.test(x = SampleA, y = SampleB)

SampleA_500 <- sample(x = A, size = 500, replace = FALSE)
SampleB_500 <- sample(x = B, size = 500, replace = FALSE)
t.test(x = SampleA_500, y = SampleB_500)

p_value <- c()
sample_number <- seq(from = 2, to = 2000, by = 2)
for (i in sample_number) {
  A_sample <- rnorm(n = i, mean = 10, sd = 5)
  B_sample <- rnorm(n = i, mean = 11, sd = 5)
  result <- t.test(x = A_sample, y = B_sample)
  p_value <- c(p_value, result$p.value)
}

plot(x = sample_number, y = p_value )

a=list()
a[[1]]=rnorm(n = 1000, mean = 10, sd = 5)
