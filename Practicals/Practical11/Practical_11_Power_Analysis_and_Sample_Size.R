colleage_students <- rnorm(n = 1000, mean = 178, sd = 10)
### p(accept H0 | H1 true)
count <- 0
for (i in 1:100000) {
  selected_students <- colleage_students[sample(x = 1:1000, size = 10, replace = FALSE)]
  result <- t.test(x = selected_students, mu = 175, alternative = "greater")
  if (result$p.value>0.05) {
    count = count + 1
  }
}
(belta = count/100000)
##power.t.test(n = 10, delta = 3, sd = 10, sig.level = 0.05, alternative = "one.sided", type = "one.sample")

count <- 0
for (i in 1:100000) {
  selected_students <- colleage_students[sample(x = 1:1000, size = 50, replace = FALSE)]
  result <- t.test(x = selected_students, mu = 175, alternative = "greater")
  if (result$p.value>0.05) {
    count = count + 1
  }
}
(belta = count/100000)
#power.t.test(n = 50, delta = 3, sd = 10, sig.level = 0.05, alternative = "one.sided", type = "one.sample")

power <- c()
Ns <- seq(from = 5, to = 100, by = 5)
for (i in Ns) {
  results <- power.t.test(n = i, delta = 3, sd = 10, sig.level = 0.05, alternative = "one.sided", type = "one.sample")
  power[i/5] <- results$power
}
plot(x = Ns,y = power, type = 'b')

test_people <- rnorm(n = 1000, mean = 117, sd = 30)
normal_people <- rnorm(n = 1000, mean = 130, sd = 30)
counts <- 0
for (i in 1:100000) {
  selected_people <- test_people[sample(x = 1:1000, size = 10, replace = FALSE)]
  selected_normal_people <- normal_people[sample(x = 1:1000, size = 10, replace = FALSE)]
  result <- t.test(x = selected_people, y = selected_normal_people, alternative = "less")
  if (result$p.value>0.05) {
    counts = counts + 1
  }
}

##Calculate the number of samples in require power
power.t.test(delta = 13, sd = 30, sig.level = 0.05, power = 0.8, type = "two.sample", alternative = "one.sided")

# If it is paired.
###Calculate the number of samples with required power
power.t.test(delta = 13, sd = 30, sig.level = 0.05, power = 0.8, type = "paired", alternative = "one.sided")

###Alphas plot out
alphas <- seq(from = 0.01, to = 0.05, by = 0.01)
number <- c()
for (i in alphas) {
  results <- power.t.test(delta = 13, sd = 30, sig.level = i, power = 0.8, alternative = "one.sided", type = "paired")
  number <- c(number, results$n)
}
plot(x = alphas, y = number, type = "b")

pows <- seq(from = 0.5, to = 0.9, by = 0.4/9)
number <- c()
for (i in pows) {
  results <- power.t.test(delta =  13, sd = 30, sig.level = 0.05, power = i, alternative = "one.sided", type = "paired")
  number <- c(number, results$n)
}
plot(x = pows, y = number, type = "b")
