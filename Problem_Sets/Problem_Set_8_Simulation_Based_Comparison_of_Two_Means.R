unlucky_class <- rnorm(n = 26, mean = 40, sd = 8)
all_class <- c()
for (i in 1:10000) {
  class_mean <- rnorm(n = 1, mean = 50, sd = 5)
  class_size <- runif(n = 1, min = 5, max = 40)
  class_raw_scores <- rnorm(n = class_size, mean = class_mean, sd = 10)
  all_class <- c(all_class, class_raw_scores)
}

unlucky_class_normative_scores <- c()
for (j in unlucky_class) {
  normative_score <- length(which(j > all_class))/length(all_class)*100
  unlucky_class_normative_scores <- c(unlucky_class_normative_scores, normative_score)
}
unlucky_class_normative_mean <- mean(unlucky_class_normative_scores)
all_class_mean <- mean(all_class)

counts <- 0
for (k in 1:10000) {
  class_mean <- rnorm(n = 1, mean = 50, sd = 5)
  class_size <- runif(n = 1, min = 5, max = 40)
  class_raw_scores <- rnorm(n = class_size, mean = class_mean, sd = 10)
  for (l in class_raw_scores) {
    normative_score <- length(which(j > all_class))/length(all_class)*100
    class_normative_scores <- c(unlucky_class_normative_scores, normative_score)
  }
  class_normative_mean <- mean(class_normative_scores)
  if (unlucky_class_normative_mean > class_normative_mean) {
    counts = counts + 1
  }
}
possibility_unlucky_class_scored_better <- counts/10000

Leonie_and_her_friends_raw_scores <- c(64, 63, 62, 59)
Sheldon_and_his_friends_raw_scores <- c(70, 63, 61, 56)
Leonie_and_her_friends_normative_scores <- c()
Sheldon_and_his_friends_normative_scores <- c()
for (l in Leonie_and_her_friends_raw_scores) {
  Leonie_and_her_friends_normative_scores <- c(Leonie_and_her_friends_normative_scores, length(which(l > all_class))/length(all_class)*100)
}
for (m in Sheldon_and_his_friends_raw_scores) {
  Sheldon_and_his_friends_normative_scores <- c(Sheldon_and_his_friends_normative_scores, length(which(m > all_class))/length(all_class)*100)
}
Leonie_and_her_friends_normative_mean_scores <- mean(Leonie_and_her_friends_normative_scores)
Sheldon_and_his_friends_normative_mean_scores <- mean(Sheldon_and_his_friends_normative_scores)