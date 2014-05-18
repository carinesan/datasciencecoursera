best <- function(state,outcome) {
        data <- read.csv("outcome-of-care-measures.csv") 
        if (!(state %in% data$State)){
                stop("invalid state")
        }
        if (!(outcome %in% c("heart attack","heart failure","pneumonia"))){
                stop("invalid outcome")
        }
        if (outcome == "heart attack"){
                sub <- subset(data, State == state, select = c("Hospital.Name",colnames(data)[11]))
                sub[ ,2] <- as.numeric(as.character(sub[ ,2]))
                result <- subset(sub, sub[ ,2] == min(sub[ ,2], na.rm = TRUE), select = "Hospital.Name")
                result <- c(as.character(result$Hospital.Name))
                return(sort(result)[1])
        }
        if (outcome == "heart failure"){
                sub <- subset(data, State == state, select = c("Hospital.Name",colnames(data)[17]))
                sub[ ,2] <- as.numeric(as.character(sub[ ,2]))
                result <- subset(sub, sub[ ,2] == min(sub[ ,2], na.rm = TRUE), select = "Hospital.Name")
                result <- c(as.character(result$Hospital.Name))
                return(sort(result)[1])
        }
        if (outcome == "pneumonia"){
                sub <- subset(data, State == state, select = c("Hospital.Name",colnames(data)[23]))
                sub[ ,2] <- as.numeric(as.character(sub[ ,2]))
                result <- subset(sub, sub[ ,2] == min(sub[ ,2], na.rm = TRUE), select = "Hospital.Name")
                result <- c(as.character(result$Hospital.Name))
                return(sort(result)[1])
        }
}