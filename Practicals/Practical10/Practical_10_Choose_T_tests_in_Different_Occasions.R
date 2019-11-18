difference <- X - Y
t_test <- (mean(difference) - 0)/sd(difference)*sqrt(length(difference))

total_degree <- length(X)-1 + length(Y)-1
S_pooled <- (length(X)-1)/total_degree * sd(X) + (length(Y) - 1)/total_degree * sd(Y)
S_difference <- S_pooled/length(X) + S_pooled/length(Y)
t <- ((mean(X)-mean(Y))-(muX - muY))/S_difference
p <- pt(-abs(t))

data("ToothGrowth")
vc_0.5 <- ToothGrowth[which(ToothGrowth$supp == "VC" & ToothGrowth$dose == 0.5),]
vc_1.0 <- ToothGrowth[which(ToothGrowth$supp == "VC" & ToothGrowth$dose == 1.0),]
vc_2.0 <- ToothGrowth[which(ToothGrowth$supp == "VC" & ToothGrowth$dose == 2.0),]
oj_0.5 <- ToothGrowth[which(ToothGrowth$supp == "OJ" & ToothGrowth$dose == 0.5),]
oj_1.0 <- ToothGrowth[which(ToothGrowth$supp == "OJ" & ToothGrowth$dose == 1.0),]
oj_2.0 <- ToothGrowth[which(ToothGrowth$supp == "OJ" & ToothGrowth$dose == 2.0),]
t.test(x = vc_0.5$len,y = oj_0.5$len, paired = FALSE)
t.test(x = vc_1.0$len,y = oj_1.0$len, paired = FALSE)
t.test(x = vc_2.0$len,y = oj_2.0$len, paired = FALSE)

data("iris")
setosa_Sepal_Length <- iris[which(iris$Species == "setosa"),]
versicolor_Sepal_Length <- iris[which(iris$Species == "versicolor"),]
var.test(x = setosa_Sepal_Length$Sepal.Length, y = versicolor_Sepal_Length$Sepal.Length)
t.test(x = setosa_Sepal_Length$Sepal.Length, y = versicolor_Sepal_Length$Sepal.Length, var.equal = F)

data_test_for_question <- iris[which(iris$Species %in% c("setosa", "versicolor")),] 
var.test(Sepal.Length ~ Species, data = data_test_for_question)
t.test(Sepal.Length ~ Species, data = data_test_for_question, var.eqaul = F)

blood_pressure <- read.csv("Week10Practical_blood_pressure.csv")
t.test(blood_pressure$bp_before, blood_pressure$bp_after, paired = TRUE)
