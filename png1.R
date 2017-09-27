data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
relevant_data<-data[data[,1]== "1/2/2007" |data[,1]== "2/2/2007",]

relevant_data[,3]<-as.numeric(as.character(relevant_data[,3]))

png(file = "plot1.png", bg = "transparent",width = 480, height = 480)
hist(relevant_data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
