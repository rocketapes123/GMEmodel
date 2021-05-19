###### Input the following values pro prediction of this day: "Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W",
###### "Beta1W","BTC","MaxPain","RGME_PD","RAMC_PD","ReturnAMPD","TenYCPD","ReturnSPY"
input <- as.matrix(c(4,-1,2298,0.27,13,2.95,0.3,1.06,1.38,-13.32,-1.61,-1.45,2.69,0.91)) #### Values as of Thursday, 2021/05/13
input <- as.matrix(c(5,0,3150,1.24,14,5,3.11,1.33,2.77,3.53,1.15,1.64,13.61,23.74,-1.82)) ### Values as of Friday, 2021/05/14
input <- as.matrix(c(1,1,1138,1.09,15,2.81,1.3,1.88,2.26,-0.65,9.68,-2.78,1.64,0.36)) #### Values as of Monday, 2021/05/17
input <- as.matrix(c(2,2,1138,1.09,16,2.721,1.62,1.79,2.47,-6.28,0,12.93,7.47,-0.89)) #### Values as of Tuesday, 2021/05/18

input <- as.matrix(c(1,0,1138,0.73,15,3.11,1.33,2.77,3.53,-0.65,9.68,-2.78,23.74,0.36,-3.5, 1.54)) ####  Values as of Monday, 2021/05/17
input <- as.matrix(c(2,0,2520,-0.06,16,2.81,1.3,1.88,2.26,-6.28,0,12.93,1.64,-0.89,2.6, -0.25)) #### Values as of Tuesday, 2021/05/18
input <- as.matrix(c(3,0,2026,-1.62,17,2.72,1.62,1.79,2.47,-1.44,0,0.04,0.57,0.18,-1.2,-0.86)) #### Values as of Wednesday, 2021/05/19


datainput<-as.data.frame(t(input))
names(datainput)<-c("Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC",
                    "MaxPain","RGME_PD","RAMC_PD","ReturnAMPD","TenYCPD","ReturnSPY")
datainput$FTD<-as.factor(datainput$FTD)
datainput$Sett<-as.factor(datainput$Sett)
datainput$Weekday<-as.factor(datainput$Weekday)
predict(lmGME,datainput, interval = "confidence", level=0.95)
