library(ggplot2)
mouse_report <- read.csv("mouse_report.csv")
ggplot(data=mouse_report,aes(x=genotype, y=weight)) +
  geom_boxplot(outlier.shape=NA) + 
  geom_jitter() +
  aes(col=genotype)
