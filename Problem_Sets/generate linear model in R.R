set.seed(18)
x = runif(n = 1000, min = 1, max = 1000)
y = 10.8*x +0.6
plot(x,y)
la = sample(x = 1:1000, size = 500)
y[la] = y[la] + rnorm(n = length(la))
plot(x, y)