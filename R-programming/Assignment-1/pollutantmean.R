pollutantmean <- function(directory, pollutant, id = 1:332){
        z <- c()

        for(i in id){
                num <- formatC(i, width=3, format = "d", flag="0")
                x <- read.csv(paste(directory,"/",num,".csv",sep=""))
                
                for(j in 1:nrow(x)){
                        v<-x[j, pollutant]
                        if(!is.na(v)){
                                z <- append(z, v) 
                        }
                }
        }
        mean(z)
}
