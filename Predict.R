###### Input the following values pro prediction of this day: "Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC"
input <- as.matrix(c(1,1,1138,1.09,15,2.81,1.3,1.88,2.26,-0.65)) #### Values as of Monday, 2021/05/17
datainput<-as.data.frame(t(input))
names(datainput)<-c("Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC")
datainput$FTD<-as.factor(datainput$FTD)
datainput$Sett<-as.factor(datainput$Sett)
datainput$Weekday<-as.factor(datainput$Weekday)
predict(lmGME,datainput, interval = "confidence", level=0.95)
