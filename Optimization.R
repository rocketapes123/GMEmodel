
simulation<- function(data, lmGME, prints=F, n, delta)
{
  
####removed
  
 return(lmGME) 
}


lmGME<-simulation(data,lmGME,n=2000,delta=0.2, prints=F)


## Check Optimization:

analyse<-as.data.table(add_predictions(as.data.frame(data),lmGME))
analyse$ÜRichtung<-ifelse(sign(analyse$ReturnGME)==sign(analyse$pred),1,0)
analyse$Fehler<-(analyse$pred-analyse$ReturnGME)
Güte <- (1-mean(analyse$ÜRichtung))*50+mean(abs(analyse$Fehler))
mean(analyse$ÜRichtung)
mean(abs(analyse$Fehler))
Güte
