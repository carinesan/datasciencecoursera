#Attribute the file to a variable
hw1_data <- read.csv("hw1_data.csv")

#Question 11
#In the dataset provided for this Quiz, what are the column names of the dataset?
names(hw1_data)

#Question 12
#Extract the first 2 rows of the data frame and print them to the console. What does the output look like ?
hw1_data[1:2, ] #or
head(hw1_data)

#Question 13
#How many observations (i.e rows) are in this data frame ?
nrow(hw1_data)

#Question 14
#Extract the last 2 rows of the data frame and print them to the console. What does the output look like ?
hw1_data[152:153, ] #or
tail(hw1_data)

#Question 15
#What is the value of Ozone in the 47th row ?
hw1_data[47,"Ozone"]

#Question 16
#How many missing values are in the Ozone column of this data frame ?
missing.values <- is.na(hw1_data$Ozone)
length(missing.values[missing.values==TRUE])

#Question 17
#What is the mean of the Ozone column in this dataset ? Exclude missing values (coded as NA) from this calculation.
mean(hw1_data$Ozone,na.rm=TRUE)

#Question 18
#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset ?
right.values <- subset(hw1_data, subset = hw1_data$Ozone > 31 & hw1_data$Temp > 90)
mean(right.values$Solar.R)

#Question 19
#What is the mean of "Temp" when "Month" is equal to 6 ?
Jun.data <- subset(hw1_data, subset = hw1_data$Month == 6)
mean(Jun.data$Temp)

#Question 20
#What was the maximum ozone value in the month of May (i.e Month = 5)?
May.data <- subset(hw1_data, subset = hw1_data$Month == 5)
max(May.data$Ozone, na.rm=TRUE)


