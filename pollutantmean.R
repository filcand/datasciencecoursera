pollutantmean <- function(directory, pollutant, id = 1:332) {

  gIpoll <-function(i) {
    data <- read.csv(paste(directory,"/",filename(i),sep=""))
    data<-data[,pollutant]
    baddata<-is.na(data)
    data[!baddata]
  }
  
  coen <- NULL
  for (i in id) {
    coen <- c(coen, gIpoll(i))
  }
  mean(coen)
}

filename <- function(i) {
  s<-as.character(i)
  s<-paste(s,".csv",sep="")
  if(i<100) {
    s<-paste("0",s,sep="")
    if (i<10) {
      s<-paste("0",s,sep="")
    } 
  }
  s
}