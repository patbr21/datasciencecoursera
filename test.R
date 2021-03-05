#test
if(!file.exists){dir.create }

library(data.table)

getwd()
list.files()
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./downloads.csv")
daten <- read.csv(file =  "downloads.csv", sep = ",")
library(dplyr)
twentyfour <- daten%>%
          filter(VAL == 24)%>%
          summarise(N = n())
FES <- daten%>%
          select(FES)
table(FES) 
typeof(FES)
str(FES)


library(xlsx)
download.file(url =  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx" , destfile = "Aufgabe3.xlsx", mode = 'wb') #destfile - destination on my pc
dat <- read.xlsx(file = "Aufgabe3.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)         
install.packages("XML")
library(XML)
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileurl, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zip <-  xpathSApply(rootNode, "//zipcode",xmlValue)
NROW(zip[zip==21231])
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "Aufgabe4.csv")
library(data.table)
DT <- fread("Aufgabe4.csv")
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
install.packages("rbenchmark"
                 )
library(rbenchmark)
x <- DT; benchmark(tapply(DT$pwgtp15,DT$SEX,mean), DT[,mean(pwgtp15),by=SEX], mean(DT$pwgtp15,by=DT$SEX), mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15),sapply(split(DT$pwgtp15,DT$SEX),mean))
                   #rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])

#achtung. nicht alle Antworten führen zu Lösungen
