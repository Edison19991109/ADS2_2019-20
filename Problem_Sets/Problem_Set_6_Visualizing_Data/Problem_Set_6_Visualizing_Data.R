library(ggplot2)
library(tidyr)
gdp <- read.csv("GDP.csv")
gdp1 <- gather(gdp,key = "Year", value = "GDP", factor_key = T,-CountryName, convert = T)
gdp1_cleaned <- gdp1[complete.cases(gdp1),]
