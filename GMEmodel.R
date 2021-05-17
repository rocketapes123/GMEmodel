data<-read.csv2("LMGME.csv")
data$Date<-NULL
data$FTD<-as.factor(data$FTD)
data$Sett<-as.factor(data$Sett)
data$Weekday<-as.factor(data$Weekday)
lmGME<-lm(ReturnGME~Sett+Volume1HPM+Return1H+FTD+Weekday+Beta.3M+Beta4W+Beta2W+Beta1W+BTC+MaxPain, data=data)
summary(lmGME)
