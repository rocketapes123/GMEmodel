

simNeutral<-read.csv2("SimNeutral.csv")
simBear<-read.csv2("SimBear.csv")
simBull<-read.csv2("SimBull.csv")
simBearAMCmoon<-read.csv2("SimBearAMCmoon.csv")

forwardpred<-function(Kursheute,sim,prints=F,start=1)
  
{
  #Kursheute<-180
  
 
  neuerKurs<-Kursheute
  Ergebnis<-as.data.frame(t(c("",0)))
                          names(Ergebnis)<-c("Datum","Kurs")
  for(i in start:nrow(sim))
    
  {
    Kursvorher<-ifelse(i==start,Kursheute,RGME_PD[1])
    input <- as.matrix(c(sim[i,]$Weekday,sim[i,]$Sett,sim[i,]$Volume1HPM,sim[i,]$Return1H,sim[i,]$FTD,sim[i,]$Beta.3M,
                          sim[i,]$Beta4W,sim[i,]$Beta2W,sim[i,]$Beta1W,sim[i,]$BTC,
                          sim[i,]$MaxPain,Kursvorher,sim[i,]$RAMC_PD,sim[i,]$ReturnAMPD,sim[i,]$TenYCPD,sim[i,]$ReturnSPY,sim[i,]$RCTweetPD
                         ,sim[i,]$RSIPD))
   # if(prints==T) {print(input)}
    datainput<-as.data.frame(t(input))
    names(datainput)<-c("Weekday","Sett","Volume1HPM","Return1H","FTD","Beta.3M","Beta4W","Beta2W","Beta1W","BTC",
                        "MaxPain","RGME_PD","RAMC_PD","ReturnAMPD","TenYCPD","ReturnSPY","RCTweetPD","RSIPD")
    datainput$FTD<-as.factor(datainput$FTD)
    datainput$Sett<-as.factor(datainput$Sett)
    datainput$Weekday<-as.factor(datainput$Weekday)
    datainput$RCTweetPD<-as.factor(datainput$RCTweetPD)
    RGME_PD<-predict(lmGME,datainput, interval = "confidence", level=0.95)
    if(prints==T) {print(RGME_PD)}
    neuerKurs<-neuerKurs*(1+RGME_PD[1]/100)
    print(c(RGME_PD[1],sim[i,]$Date,neuerKurs))
    Ergebnis<-rbind(Ergebnis,c(sim[i,]$Date,neuerKurs))
  }
  return(Ergebnis)
}

ErgebnisNeutral<-forwardpred(222,simNeutral,prints = F,start=8)
ErgebnisBear<-forwardpred(222,simBear,start=8)
ErgebnisBull<-forwardpred(222,simBull,start=8)
ErgebnisAMCmoon<-forwardpred(222,simBearAMCmoon,start=8)
ErgebnisNeutral$Kurs<-as.numeric(ErgebnisNeutral$Kurs)
ErgebnisBear$Kurs<-as.numeric(ErgebnisBear$Kurs)
ErgebnisBull$Kurs<-as.numeric(ErgebnisBull$Kurs)
ErgebnisAMCmoon$Kurs<-as.numeric(ErgebnisAMCmoon$Kurs)
write.csv2(ErgebnisNeutral,"ErgebnisNeutral.csv")
write.csv2(ErgebnisBear,"ErgebnisBear.csv")
write.csv2(ErgebnisBull,"ErgebnisBull.csv")
write.csv2(ErgebnisAMCmoon,"ErgebnisAMCmoon.csv")



forwardpredstep<-function(Kursheute,sim,prints=F,start=1)
  
{
  #Kursheute<-180
  
  
  neuerKurs<-Kursheute
  Ergebnis<-as.data.frame(t(c("",0)))
  names(Ergebnis)<-c("Datum","Kurs")
  for(i in start:nrow(sim))
    
  {
    Kursvorher<-ifelse(i==start,Kursheute,RGME_PD[1])
    input <- as.matrix(c(sim[i,]$Sett,sim[i,]$Volume1HPM,sim[i,]$Return1H,sim[i,]$FTD,
                         sim[i,]$Beta4W,sim[i,]$Beta2W,sim[i,]$Beta1W,
                         sim[i,]$ReturnAMPD
                         ,sim[i,]$RSIPD))
    # if(prints==T) {print(input)}
    datainput<-as.data.frame(t(input))
    names(datainput)<-c("Sett","Volume1HPM","Return1H","FTD","Beta4W","Beta2W","Beta1W"
                       ,"ReturnAMPD","RSIPD")
    datainput$FTD<-as.factor(datainput$FTD)
    datainput$Sett<-as.factor(datainput$Sett)
    RGME_PD<-predict(lmGMEstepOpt,datainput, interval = "confidence", level=0.95)
    if(prints==T) {print(RGME_PD)}
    neuerKurs<-neuerKurs*(1+RGME_PD[1]/100)
    print(c(RGME_PD[1],sim[i,]$Date,neuerKurs))
    Ergebnis<-rbind(Ergebnis,c(sim[i,]$Date,neuerKurs))
  }
  return(Ergebnis)
}


ErgebnisNeutral<-forwardpredstep(222,simNeutral,prints = F,start=8)
ErgebnisBear<-forwardpredstep(222,simBear,start=8)
ErgebnisBull<-forwardpredstep(222,simBull,start=8)
ErgebnisAMCmoon<-forwardpredstep(222,simBearAMCmoon,start=8)
ErgebnisNeutral$Kurs<-as.numeric(ErgebnisNeutral$Kurs)
ErgebnisBear$Kurs<-as.numeric(ErgebnisBear$Kurs)
ErgebnisBull$Kurs<-as.numeric(ErgebnisBull$Kurs)
ErgebnisAMCmoon$Kurs<-as.numeric(ErgebnisAMCmoon$Kurs)
write.csv2(ErgebnisNeutral,"ErgebnisNeutral.csv")
write.csv2(ErgebnisBear,"ErgebnisBear.csv")
write.csv2(ErgebnisBull,"ErgebnisBull.csv")
write.csv2(ErgebnisAMCmoon,"ErgebnisAMCmoon.csv")
