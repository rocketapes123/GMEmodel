library("data.table")
library("modelr")


data<-read.csv2("LMGME.csv") ### or LMGME_e.csv
data$Date<-NULL
data$FTD<-as.factor(data$FTD)
data$Sett<-as.factor(data$Sett)
data$Weekday<-as.factor(data$Weekday)
data$RCTweetPD<-as.factor(data$RCTweetPD)
#data<-data[data$FTD!=21,]
#data<-data[data$FTD!=1,]
#data<-data[data$Volume1HPM<10000,]
lmGME<-lm(ReturnGME~Sett+Volume1HPM+Return1H+FTD+Weekday+Beta.3M+Beta4W+Beta2W+Beta1W+BTC+MaxPain
          +RGME_PD+RAMC_PD+ReturnAMPD+TenYCPD+ReturnSPY+RCTweetPD+RSIPD+SP1H+AMC1H+MACDHISTPD
          +mPlastPrice, data=data)
