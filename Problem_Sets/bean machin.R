result <- {}
for (i in 1:1000) {
 result[i] =sum(sample(x = c(-1,1), size = 8, replace = TRUE ))
}
hist(result)