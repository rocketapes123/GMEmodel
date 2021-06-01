### stepwise reduction of variables

lmGMEstep<-step(lmGME, direction = "both")

lmGMEstepOpt<-simulation(data,lmGMEstep,n=50000,delta=0.5, prints=F)
lmGMEstepOpt<-simulation(data,lmGMEstepOpt,n=200000,delta=0.2, prints=F)

analysestep<-as.data.table(add_predictions(as.data.frame(data),lmGMEstepOpt))
analysestep$ÜRichtung<-ifelse(sign(analysestep$ReturnGME)==sign(analysestep$pred),1,0)
analysestep$Fehler<-(analysestep$pred-analysestep$ReturnGME)*analysestep$Weight
Gütestep <- (1-mean(analysestep$ÜRichtung))*50+mean(abs(analysestep$Fehler))
mean(analysestep$ÜRichtung)
median(abs(analysestep$Fehler))
Gütestep
analysestep[50:80,]


