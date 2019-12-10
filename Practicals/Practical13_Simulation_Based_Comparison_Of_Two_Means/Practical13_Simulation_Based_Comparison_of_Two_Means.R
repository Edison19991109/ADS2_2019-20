trial <- read.csv('drug_trial.csv')
library('ggplot2')
d <- ggplot(trial, aes(x= treatment,y= pain, colour=treatment))
d + geom_boxplot()

placebo <- data.frame(trial[1:15,])
droplevels(x = placebo$treatment)
drugA <- data.frame(trial[16:30,])
droplevels(x = drugA$treatment)
drugB <- data.frame(trial[31:44,])
droplevels(x = drugB$treatment)
first_point <- placebo[sample(x = 1:15, size = 2, replace = FALSE),]
third_point <- drugA[sample(x = 1:15, size = 1, replace = FALSE),]
difference_the_same_group <- abs(first_point[1,2] - first_point[2,2])
difference_different_group <- abs(first_point[1,2] - third_point[1,2])

same_group <-function(group){
  difference <- c()
  for (i in 1:(length(group)-1)) {
    for (j in (i+1):(length(group))) {
      difference <- c(difference, abs(group[i]-group[j]))
    }
  }
  return(difference)
}

difference <- c(same_group(drugB$pain), same_group(drugA$pain), same_group(placebo$pain))
difference_same <- sum(difference)/length(difference)

different_group <-function(group1, group2){
  difference <- c()
  for (i in 1:length(group1)) {
    for (j in 1:length(group2)) {
      difference <- c(difference, abs(group1[i]-group2[j]))
    }
  }
  return(difference)
}

same <- c(different_group(drugA$pain,drugB$pain), different_group(drugA$pain, placebo$pain), 
  different_group(drugB$pain, placebo$pain))
difference_different <- sum(same)/length(same)

boxplot(difference, same, names = c('same group', 'different group'), ylab = 'difference')

new_order <- sample(x = 1:44, size = 44, replace = FALSE)
new_drug_A <- trial$pain[new_order[1:15]]
new_drug_B <- trial$pain[new_order[16:29]]
new_placebo <- trial$pain[new_order[16:29]]#