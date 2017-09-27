data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
relevant_data<-data[data[,1]== "1/2/2007" |data[,1]== "2/2/2007",]

library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "C")

relevant_data[,5]<-as.numeric(as.character(relevant_data[,5]))
relevant_data[,6]<-as.numeric(as.character(relevant_data[,6]))
relevant_data[,7]<-as.numeric(as.character(relevant_data[,7]))
relevant_data[,8]<-as.numeric(as.character(relevant_data[,8]))
relevant_data[,9]<-as.numeric(as.character(relevant_data[,9]))

datetime <- strptime(paste(relevant_data$Date, relevant_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(file = "plot4.png", bg = "transparent",width = 480, height = 480)

par(mfcol=c(2,2))

plot(datetime, relevant_data$Global_active_power,  ylab="Global Active Power (kilowatts)", xlab = " ", lty=1, pch=".")
lines(datetime, relevant_data$Global_active_power, lty=1, pch=".")

plot(datetime, relevant_data$Sub_metering_1,  ylab="Energy sub metering", xlab = " ", lty=1, pch=".")
lines(datetime, relevant_data$Sub_metering_1,  lty=1, pch=".", col="black")
lines(datetime, relevant_data$Sub_metering_2,  lty=1, pch=".", col="red")
lines(datetime, relevant_data$Sub_metering_3,  lty=1, pch=".", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"),lty=1, cex=0.8)

plot(datetime, relevant_data$Voltage,  ylab="Voltage", lty=1, pch=".")
lines(datetime, relevant_data$Voltage, lty=1, pch=".")

plot(datetime, relevant_data$Global_reactive_power,  xlab ="datetime", ylab="Global_reactive_power", lty=1, pch=".")
lines(datetime, relevant_data$Global_reactive_power, lty=1, pch=".")

dev.off()