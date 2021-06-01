
simulation<- function(data, lmGME, prints=F, n, delta)
{
  
  analysestart<-as.data.table(add_predictions(as.data.frame(data),lmGME))
  analysestart$ÜRichtung<-ifelse(sign(analysestart$ReturnGME)==sign(analysestart$pred),1,0)
  analysestart$Fehler<-(analysestart$pred-analysestart$ReturnGME)*analysestart$Weight
  Gütestart <- (1-mean(analysestart$ÜRichtung))*50+mean(abs(analysestart$Fehler))
  coefs<-lmGME$coefficients
  lmGMEt<-lmGME
  for( i in 1:n)
    
  {
    rand1<-floor(runif(1,1, length((coefs))+1))
    rand2<-floor(runif(1,1, length((coefs))+1))
    
    randv1<-runif(1,-delta,delta)
    randv2<-runif(1,-delta,delta)
    
    lmGMEt$coefficients[rand1]<-lmGMEt$coefficients[rand1]*(1+randv1)
    lmGMEt$coefficients[rand2]<-lmGMEt$coefficients[rand2]*(1+randv2)
    #if(prints==T){print(lmGMEt$coefficients[rand1]*(1+randv1))}
    #if (prints==T){print(lmGMEt$coefficients[rand2]*(1+randv2))}
    analysetmp<-as.data.table(add_predictions(as.data.frame(data),lmGMEt))
    analysetmp$ÜRichtung<-ifelse(sign(analysetmp$ReturnGME)==sign(analysetmp$pred),1,0)
    analysetmp$Fehler<-(analysetmp$pred-analysetmp$ReturnGME)*analysetmp$Weight
    Güte <- (1-mean(analysetmp$ÜRichtung))*50+mean(abs(analysetmp$Fehler))
    if(prints==T){print(Güte)}
    if (Güte <= Gütestart)
      
    {
      lmGME<-lmGMEt
      print(c(i,Gütestart,Güte,names(lmGMEt$coefficients[rand1])
            ,names(lmGMEt$coefficients[rand2]))
            )
      Gütestart<-Güte
    } else {
      
      lmGMEt<-lmGME
    }
  }
  
  
 return(lmGME) 
}


lmGME<-simulation(data,lmGME,n=10000,delta=0.5, prints=F)
lmGME<-simulation(data,lmGME,n=100000,delta=0.2, prints=F)


## Check Optimization:

analyse<-as.data.table(add_predictions(as.data.frame(data),lmGME))
analyse$ÜRichtung<-ifelse(sign(analyse$ReturnGME)==sign(analyse$pred),1,0)
analyse$Fehler<-(analyse$pred-analyse$ReturnGME)*analyse$Weight
Güte <- (1-mean(analyse$ÜRichtung))*50+mean(abs(analyse$Fehler))
mean(analyse$ÜRichtung)
median(abs(analyse$Fehler))
Güte
analyse[50:80,]
