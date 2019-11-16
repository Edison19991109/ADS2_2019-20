Tsts_ <- read.csv("Tests_PGP3.csv", na.strings = c("NA",""))
library("tidyr")
tidy_test <- drop_na(Tsts_)
anyNA(tidy_test)

tidy_test$sex <- gsub(1, "M" , tidy_test$sex)
tidy_test$sex <- gsub(2, "F", tidy_test$sex)


boxplot( data=tidy_test, elisa.od ~ sex)

ggplot(data = tidy_test, aes(sex, elisa.od)) + geom_boxplot()
ggplot(data = tidy_test, aes(age.f, elisa.od)) + geom_boxplot()
