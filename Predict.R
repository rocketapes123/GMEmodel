###### Input the following values pro prediction of this day: "Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC","MaxPain"
input <- as.matrix(c(4,-1,2298,0.27,13,2.95,0.3,1.06,1.38,-13.32,-1.61)) #### Values as of Thursday, 2021/05/13
input <- as.matrix(c(5,0,3150,1.24,14,5,3.11,1.33,2.77,3.53,1.15,1.64)) ### Values as of Friday, 2021/05/14
input <- as.matrix(c(1,1,1138,1.09,15,2.81,1.3,1.88,2.26,-0.65,9.68)) #### Values as of Monday, 2021/05/17

datainput<-as.data.frame(t(input))
names(datainput)<-c("Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC","MaxPain")
datainput$FTD<-as.factor(datainput$FTD)
datainput$Sett<-as.factor(datainput$Sett)
datainput$Weekday<-as.factor(datainput$Weekday)
predict(lmGME,datainput, interval = "confidence", level=0.95)
