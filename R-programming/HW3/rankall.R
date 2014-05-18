rankall <- function(outcome, num = "best"){
        data <- read.csv("outcome-of-care-measures.csv")
        States <- data$State
        state <- sort(unique(States))
        hospital <- c()
        if (!(outcome %in% c("heart attack","heart failure","pneumonia"))){
                stop("invalid outcome")
        }
        for (i in 1:length(state)){
                if (outcome == "heart attack"){
                        sub <- subset(data, State == state[i], select = c("Hospital.Name",colnames(data)[11]))
                        sub[ ,2] <- as.numeric(as.character(sub[ ,2]))
                        rank <- sub[order(sub[ ,2], sub[ ,1], na.last = NA), ]
                        rank <- c(as.character(rank$Hospital.Name))
                }
                else if (outcome == "heart failure"){
                        sub <- subset(data, State == state[i], select = c("Hospital.Name",colnames(data)[17]))
                        sub[ ,2] <- as.numeric(as.character(sub[ ,2]))
                        rank <- sub[order(sub[ ,2], sub[ ,1], na.last = NA), ]
                        rank <- c(as.character(rank$Hospital.Name))
                        
                }
                else if (outcome == "pneumonia"){
                        sub <- subset(data, State == state[i], select = c("Hospital.Name",colnames(data)[23]))
                        sub[ ,2] <- as.numeric(as.character(sub[ ,2]))
                        rank <- sub[order(sub[ ,2], sub[ ,1], na.last = NA), ]
                        rank <- c(as.character(rank$Hospital.Name))
                }
                else {
                        stop("invalid outcome")
                }
                if (num == "best"){
                        r <- 1                                
                }
                else if (num == "worst"){
                        r <- length(rank)
                }
                else if (num <= length(rank)){
                        r <- num
                }
                result <- rank[r]
                hospital <- append(hospital,result)
        }
        dataframe <- data.frame(hospital=hospital,state=state)
}