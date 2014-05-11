complete <- function(directory, id=1:332){
        nobs <- c()
        for(i in id){
                num <- formatC(i, width=3, format = "d", flag="0")
                x <- read.csv(paste(directory,"/",num,".csv",sep=""))
                
                nob=0
                
                for(j in 1:nrow(x)){        
                        c <- complete.cases(x[j, ])
                        if (c) {
                                nob=nob+1                                
                        }
                }
                nobs <- append(nobs,nob)
        }
        df <- data.frame(id,nobs)
}
