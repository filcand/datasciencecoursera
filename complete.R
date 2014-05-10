source("pollutantmean.R")

complete <- function(directory, id = 1:332) {
  final<-data.frame("id"=NULL, "nobs"=NULL)
  for (i in id) {
      data <- read.csv(paste(directory,"/",filename(i),sep=""))
      badSulf<-is.na(data[,"sulfate"])
      badNitr<-is.na(data[,"nitrate"])
      baddata<-badSulf|badNitr
      numgood<-length(baddata[!baddata])
      new=data.frame("id"=i,"nobs"=numgood)
      final<-rbind(final, new)
  }    
  final
}