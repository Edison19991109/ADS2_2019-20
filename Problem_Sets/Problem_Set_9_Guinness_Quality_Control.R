# Do a t-test to determine whether there is a difference from 50 pins.
pin_taste <- read.table("barley.txt")
t.test(pin_taste, mu = 50, alternative = "two.sided")

# Run a simulation to see how small is enough to detect significant difference.
simulation_result <- c()
for (i in 2:50) {
  count <- 0
  for (j in 1:100) {
    pin_sample <- pin_taste[c(sample(x = 1:50, size = i, replace = FALSE)), 1]
    res <- t.test(pin_sample, mu = 50, alternative = "two.sided")
    if (res$p.value <= 0.05) {
      count = count + 1
    }
  }
  simulation_result[i] <- count
}
plot(simulation_result, type = "b")

### min(which(simulation_result >= 95))
