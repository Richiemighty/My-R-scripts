Physical<-c(110,96,84,76)
Life<-c(201,187,153,122)
Mathematical<-c(222,176,139,128)
Biological<-c(167,166,142,111)
Chemical<-c(98,100,85,69)
DATA<-data.frame(Physical,Life,Mathematical,Biological,Chemical)
DATA
colours=c("GREEN","BLUE","YELLOW","PINK")
barplot(as.matrix(DATA),main="BAR CHART FOR STUDENTS POPULATION ACCORDING TO DEPARTMENT RECORDS",ylab="NO. OF STUDENTS",xlab="DEPARTMENT",names.arg=c("PHYSICAL","LIFE","MATHEMATICAL","BIOLOGICAL","CHEMICAL"),cex.lab=1.6,cex.main=1.4,beside=TRUE,col=colours)
legend("topright",c("100 level","200 level","300 level","400 level"),cex=0.9,bty="n",fill=colours)
 