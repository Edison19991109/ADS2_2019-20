grades <- rnorm(100,mean = 86, sd = 5.0)
hist(grades, xlab = "Students' grades", col = "pink")
countnumber <- sum(grades>91 | grades<81)
countnum <- sum(grades>96 | grades < 76)