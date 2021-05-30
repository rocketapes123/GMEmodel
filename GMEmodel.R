data<-read.csv2("LMGME.csv")
data$Date<-NULL
data$FTD<-as.factor(data$FTD)
data$Sett<-as.factor(data$Sett)
data$Weekday<-as.factor(data$Weekday)
########removed
summary(lmGME)
