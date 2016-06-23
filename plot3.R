data<-read.csv("household_power_consumption.txt",sep=";")
dataset<-data[as.character(data[,1])=="1/2/2007"|as.character(data[,1])=="2/2/2007",]
# create a new column that combines both date and time data
dataset$Timestamp <-paste(dataset$Date,dataset$Time)
png(file="plot3.png")
plot(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"), as.numeric(paste(dataset$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"), as.numeric(paste(dataset$Sub_metering_2)), type = "l",col="red")
lines(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"), as.numeric(paste(dataset$Sub_metering_3)), type = "l",col="blue")
legend("topright",lty=1,col=c("Black","red","blue"),legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
