data <- read.csv('Rdata_diamonds_samples100_mdf.csv')
head(data)
typeof(data$ID)
class(data$ID)
head(data$carat)
class(data$carat)
head(data$cut)
class(data$cut)
cut.chr <- as.character(data$cut)
class(cut.chr)

var1=c(2,3,5,6)
class(var1)
var2=c(2.0,3.9,5.1,6.9)
class(var2)
var3=c(2L,3L,5L,6L)
class(var3)

var.num=c(2.0,3.9,5.1,6.9)
print(var.num)
class(var.num)
var.int=c(2L,3L,5L,6L)
print(var.int)
class(var.int)
var.char=c("Hello",",","world","!")
class(var.char)
print(var.char)
var.fac=factor(c("mid","mid","high","low"),
               levels=c("low","mid","high"))
print(var.fac)
class(var.fac)
data.list=list(var.num,var.int,var.char,var.fac)
head(data.list)
data.list[[1]]
data.list[[1]][1]
data.list[[3]]
data.list[[3]][3]
length(data.list)
dim(data.list)
data.matrix <- as.matrix(data)
head(data.matrix)
class(data.matrix[, 1])
class(data.matrix[ ,2])

head(data)
head(is.na(data))
tail(data)
tail(is.na(data))
#Double check#2 represents column
apply(is.na(data),2,which)
dim(data)
data.noNA=data[complete.cases(data),]
dim(data.noNA)               
print(data[!complete.cases(data),])#All column
print(data[!complete.cases(data),2])
duplicated(data.noNA)
frw.idx=which(duplicated(data.noNA)) 
rvs.idx=which(duplicated(data.noNA,fromLast = TRUE))
data.noNA[c(frw.idx,rvs.idx),]

dim(data.noNA)
data.noNA.noDup=data.noNA[!duplicated(data.noNA),]
dim(data.noNA.noDup)
#Create a data frame. New Column added.
data.noNA.noDup=data.frame(data.noNA.noDup,volume=data.noNA.noDup$x*data.noNA.noDup$y*data.noNA.noDup$z)
head(data.noNA.noDup)
plot(x=data.noNA.noDup$carat,y=data.noNA.noDup$volume,
     pch=20,col="darkgoldenrod4",
     las=1,xlab="carat",ylab="volume",
     main="diamond carat ~ volume")
text(data.noNA.noDup$carat, data.noNA.noDup$volume,
     labels=data.noNA.noDup$ID,col="dimgray",
     cex= 0.7, pos=4)
print(data.noNA.noDup[which(data.noNA.noDup$ID=="7"),])
print(data.noNA.noDup[which(data.noNA.noDup$ID=="28"),])
head(data.noNA.noDup[,9:11])
print(data.noNA.noDup[duplicated(data.noNA.noDup[,9:11],fromLast = "TRUE"),])
fwrd.dup.idx=which(duplicated(data.noNA.noDup[,9:11]))
rvse.dup.idx=which(duplicated(data.noNA.noDup[,9:11],fromLast = TRUE))
data.noNA.noDup[c(fwrd.dup.idx,rvse.dup.idx),]
data.noNA.noDup.noStrg=data.noNA.noDup[-which(data.noNA.noDup$ID==7 | data.noNA.noDup$ID==28),]
dim(data.noNA.noDup)
dim(data.noNA.noDup.noStrg)

class(data.noNA.noDup.noStrg$cut)
class(data.noNA.noDup.noStrg$clarity)
data.noNA.noDup.noStrg$cut
data.noNA.noDup.noStrg[which(data.noNA.noDup.noStrg$cut=='Idea'),]
data.noNA.noDup.noStrg[which(data.noNA.noDup.noStrg$cut=='Idea'),]
data.noNA.noDup.noStrg.notypo=data.noNA.noDup.noStrg
head(data.noNA.noDup.noStrg)
data.noNA.noDup.noStrg.notypo$cut[1]
data.noNA.noDup.noStrg.notypo$cut[which(data.noNA.noDup.noStrg.notypo$cut=="Idea")]="Ideal"
summary(data.noNA.noDup.noStrg.notypo$cut)

plot(x=data.noNA.noDup.noStrg.notypo$carat,y=data.noNA.noDup.noStrg.notypo$price,
     pch=20,col="darkgoldenrod3",
     las=1,xlab="carat",ylab="price",
     main="diamond carat ~ price")
text(data.noNA.noDup.noStrg.notypo$carat, data.noNA.noDup.noStrg.notypo$price,
     labels=data.noNA.noDup.noStrg.notypo$ID,col="dimgray",
     cex= 0.7, pos=4)
data.noNA.noDup.noStrg.notypo[which(data.noNA.noDup.noStrg.notypo$ID==96 | data.noNA.noDup.noStrg.notypo$ID==27),]
print(data.noNA.noDup.noStrg.notypo[(which(data.noNA.noDup.noStrg.notypo$ID=="96")-2):(which(data.noNA.noDup.noStrg.notypo$ID=="96")+2),])
print(data.noNA.noDup.noStrg.notypo[(which(data.noNA.noDup.noStrg.notypo$ID=="27")-2):(which(data.noNA.noDup.noStrg.notypo$ID=="27")+2),])

outlier.idx=rep(0,nrow(data.noNA.noDup.noStrg.notypo))
outlier.idx[which(data.noNA.noDup.noStrg.notypo$ID==96)]=1
outlier.idx[which(data.noNA.noDup.noStrg.notypo$ID==27)]=1
data.noNA.noDup.noStrg.notypo.mkOtlr=data.frame(data.noNA.noDup.noStrg.notypo,otlr=outlier.idx)
head(data.noNA.noDup.noStrg.notypo.mkOtlr)
tail(data.noNA.noDup.noStrg.notypo.mkOtlr)
plot(x=data.noNA.noDup.noStrg.notypo$cut,y=data.noNA.noDup.noStrg.notypo$price,
     pch=20,col="darkgoldenrod3",
     las=1,xlab="cut",ylab="price",
     main="diamond cut ~ price")

library('ggplot2')

p <- ggplot(data = data.noNA.noDup.noStrg.notypo, aes(x = carat, y = price, colour = clarity))
p <- p + geom_point(size = 2)
p2 <-p + geom_line()
p2
p3 	<- p2 + geom_text(aes(label =carat),hjust = 0.1, nudge_x = 0.05 ,size=
                2) + labs(title = "diamond carat ~ price")
p4 <- p3 + facet_grid(~clarity)
p4
