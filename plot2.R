data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
relevant_data<-data[data[,1]== "1/2/2007" |data[,1]== "2/2/2007",]

library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "C")

relevant_data[,3]<-as.numeric(as.character(relevant_data[,3]))

datetime <- strptime(paste(relevant_data$Date, relevant_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(file = "plot2.png", bg = "transparent",width = 480, height = 480)
plot(datetime, relevant_data$Global_active_power,  xlab ="Weekdays", ylab="Global Active Power (kilowatts)", lty=1, pch=".")
lines(datetime, relevant_data$Global_active_power,  lty=1, pch=".")
dev.off()
