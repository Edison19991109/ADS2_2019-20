library("ggplot2")
data('diamonds')
g <- ggplot(data = diamonds, aes(x = carat, y = price))
g + geom_point(aes(group= cut, colour=cut), size = 0.1, shape = 18)

d <- ggplot(diamonds, aes(x = carat)) + xlim(0, 3)
d + geom_histogram(stat = 'bin', fill = "steelblue", binwidth = 0.1)

png(files = "practical6_2.png", width = 500, height = 500, units = "px")
e <- ggplot(diamonds, aes(x = clarity, y = carat))
e <- e + geom_boxplot(aes(colour = cut))
sm <- e + geom_smooth(aes(group = cut), method = "lm")
#b <- sm + facet_grid(cut~color)
c <- sm + labs(title = "Carats vs clarity boxplot")
c <- c + scale_color_brewer()
c
dev.off()

e <- e + scale_y_continuous(trans = "log10")
f <- ggplot(diamonds, aes(x = clarity, y = log10(carat)))
f <- f + geom_boxplot(aes(colour = cut))
f
e <- e + geom_smooth(aes(group = cut), method = "lm")
e
