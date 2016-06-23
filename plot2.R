data<-read.csv("household_power_consumption.txt",sep=";")
dataset<-data[as.character(data[,1])=="1/2/2007"|as.character(data[,1])=="2/2/2007",]
#Creates new column that combines date and time
dataset$Timestamp <-paste(dataset$Date, dataset$Time)
png(file="plot2.png")
plot(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"), as.numeric(paste(dataset$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
