library(ggplot2)
library(tidyr)
library(dplyr)
gdp <- read.csv("GDP.csv", na.strings = "", header = T, check.names = FALSE)
## Should set check.names as false.
gdp <- gather(gdp,key = "Year", value = "GDP", factor_key = T,-CountryName, convert = T)
#gdp1_cleaned <- gdp1[complete.cases(gdp1),]
gdp.noNA <- drop_na(gdp)
gdp.sub <- dplyr::filter(gdp.noNA, CountryName %in% c("France","Germany","Italy","Greece"),Year %in% c( 1960,1970,1980,1990,2000,2010,2018) )
summary(gdp.sub)
droplevels(gdp.sub$CountryName)
##gdp_filter_country <- filter(gdp1_cleaned, gdp1_cleaned$CountryName == c('Germany')
##                            | gdp1_cleaned$CountryName == c('France')
##                            | gdp1_cleaned$CountryName == c('Italy')
##                            | gdp1_cleaned$CountryName == c('Greece'))
##gdp_filter_country_2 <- filter(gdp_filter_country, gdp_filter_country$Year == "X1960")

g <- ggplot(data = gdp.sub, aes(x = Year, y = GDP, colour = CountryName))
g1 <- g + geom_point(size = 2)
g2 <- g1 + geom_line()
g3 <- g2 + geom_text(aes(label = GDP), size = 2)
g4 <- g3 + labs(title = 'GDP trends in the countries', x = 'Year', y='GDP')+
theme(plot.title = element_text(hjust = 0.5))+scale_colour_hue("CountryName")

g5 <- g4 + scale_y_continuous(trans = 'log2')
g6 <- g5 + facet_grid(~CountryName)
### facet_wrap cut horizonilly


g7 <- g1 + geom_smooth(method = 'loess')

g8 <- g + geom_area(aes(fill=CountryName), position = "fill")

g9 <- g + geom_bar(stat = "identity",aes(group=CountryName,fill=CountryName),position = "dodge")

gdp.2018 <- dplyr::filter(gdp.noNA, CountryName %in% c("France","Germany","Italy","Greece"),Year %in% c(2018) )
summary(gdp.2018)
droplevels(gdp.2018$CountryName)

library(maps)
eu <- map_data('world', region = c("France","Germany","Italy","Greece"))
eu
ggplot(eu, aes(x = long, y = lat, group = group)) + geom_polygon(aes(fill = region))

da <- dplyr::left_join(x = eu, y =gdp.2018 , by = c('region' = 'CountryName'))
map <- ggplot(da, aes(x = long, y = lat, group = group)) + geom_polygon(aes(fill = GDP))
map <- map + labs(title = "2018 GDP in eu countries")+ scale_fill_gradient(low="dark blue",high="red",breaks=c(1e+12,2e+12,3e+12),labels=c("1 Trillion","2 Trillion","3 Trillion"))
png("GDP map.png", width = 600, height = 600) 
dev.off()
