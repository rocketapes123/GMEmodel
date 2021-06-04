###### Input the following values pro prediction of this day: "Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W",
###### "Beta1W","BTC","MaxPain","RGME_PD","RAMC_PD","ReturnAMPD","TenYCPD","ReturnSPY"

input <- as.matrix(c(2,0,15527,3.52,4,0.97,1.33,-2.79,-7.34,4.5,-0,-12.64,-1.51,-0.56,-2.1,0.18,0,62.05,0.3,12.09,-1.2)) #### Dienstag 01.06.
input <- as.matrix(c(3,0,15527,1.25,5,0.89,1.19,-1.03,-6.51,-1.74,2.5,12.17,22.66,2.96,2.9,-0.09,0,67.54,-0.04,8.25,0.46)) #### Mittwoch 02.06.
input <- as.matrix(c(4,0,15527,1.25,6,1.24,1.24,-2.02,-21.3,2.67,7.32,13.34,95.22,0.62,-2.5,0.16,0,72.75,-0.04,0,1.85)) #### Donnerstag 03.06.
input <- as.matrix(c(5,0,5117,-0.05,7,1.24,1.24,-2.02,-21.3,0.79,4.55,-8.52,-17.92,-0.74,3.7,-0.37,1,64.65,0.11,1.71,-1.05,-10.91)) #### Friday 04.06.


datainput<-as.data.frame(t(input))
names(datainput)<-c("Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC",
                    "MaxPain","RGME_PD","RAMC_PD","ReturnAMPD","TenYCPD","ReturnSPY","RCTweetPD","RSIPD"
                    ,"SP1H","AMC1H","MACDHISTPD","mPlastPrice")
datainput$FTD<-as.factor(datainput$FTD)
datainput$Sett<-as.factor(datainput$Sett)
datainput$Weekday<-as.factor(datainput$Weekday)
datainput$RCTweetPD<-as.factor(datainput$RCTweetPD)
predict(lmGME,datainput, interval = "confidence", level=0.95)
predict(lmGMEorig,datainput, interval = "confidence", level=0.95)
predict(lmGMEstep,datainput, interval = "confidence", level=0.95)
predict(lmGMEstepOpt,datainput, interval = "confidence", level=0.95)
