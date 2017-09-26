data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
relevant_data<-data[data[,1]== "1/2/2007" |data[,1]== "2/2/2007",]

relevant_data[,3]<-as.numeric(as.character(relevant_data[,3]))

hist(relevant_data$Global_active_power)