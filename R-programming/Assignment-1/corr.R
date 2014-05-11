corr <- function(directory,threshold="0"){
        cors<-c()
        result <- c()
        dir <- list.files("specdata")
        for(i in dir){ 
                nobs.df <- complete(directory,which(dir==i))
                if(nobs.df[1,2] > threshold){
                        dataset <- read.csv(paste(directory,"/",i,sep=""))
                        cors <- cor(dataset$sulfate,dataset$nitrate,use="complete.obs")
                }
                else{
                        cors <- NULL
                }
                result <- append(result,cors)
        }
        print(result)
}
