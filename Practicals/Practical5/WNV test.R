setwd("C:/Users/KANG Jianning/Documents/GitKraken/ADS2_2019-20/Practicals/Practical5")

WNV <- read.csv(file = "WNV_mosquito_test_results.csv", na.strings = "" )
library("tidyr")
tidy_WNV <- drop_na(WNV)
anyNA(tidy_WNV)

#WNV[WNV == ""] = NA
#levels(as.factor(WNV$LOCATION))

#data.nomissing <- compelte.cases(Data)
#data.nona <- data.nona[data.nomissing,]

class(tidy_WNV$SEASON.YEAR)
names(tidy_WNV)[1] <- "YEAR"

class(tidy_WNV$TEST.DATE)
tidy_WNV$TEST.DATE <- as.POSIXct(tidy_WNV$TEST.DATE, "America/Chicago", format = "%m/%d/%Y %H:%M:%S")
class(tidy_WNV$TEST.DATE)

dat1 <- tidy_WNV[1,6]
dat1

tidy_WNV$LOCATION
gsub("[()]", "", tidy_WNV$LOCATION,perl = T)



