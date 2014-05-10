source("pollutantmean.R")

corr <- function(directory, threshold = 0) {
  corel <- NULL
  for (i in 1:332) {
    data <- read.csv(paste(directory,"/",filename(i),sep=""))
    sulf<-data[,"sulfate"]
    nitr<-data[,"nitrate"]
    badSulf<-is.na(sulf)
    badNitr<-is.na(nitr)
    baddata<-badSulf|badNitr
    numgood<-length(baddata[!baddata])
    if (numgood >= threshold) {
      corel<-c(corel,cor(sulf[!baddata],nitr[!baddata]))
    }
  }
  corel
}