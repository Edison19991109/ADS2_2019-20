drug_trial <- read.csv('drug_trial(1).csv')
library('ggplot2')
d <- ggplot(drug_trial, aes(x= treatment,y= pain, colour=treatment))
d + geom_boxplot()

model <- aov(pain~treatment, data = drug_trial)
plot(model)
summary(model)

hist(resid(model), main = 'residues')
shapiro.test(x = resid(model))
TukeyHSD(model)


mouse_weight <- read.csv('mouse_experiment.csv')
d <- ggplot(mouse_weight, aes(x= genotype,y= weight_gain, colour=diet))
d + geom_boxplot()

model2 <- aov(weight_gain~genotype*diet, data = mouse_weight)
plot(model2)
summary(model2)
TukeyHSD(model2)
