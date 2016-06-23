data<-read.csv("household_power_consumption.txt",sep=";")
dataset<-data[as.character(data[,1])=="1/2/2007"|as.character(data[,1])=="2/2/2007",]
# create a new column that combines both date and time data
dataset$Timestamp <-paste(dataset$Date,dataset$Time)
# convert active and reactive  power in numeric data
dataset$Global_active_power=as.numeric(paste(dataset$Global_active_power))
dataset$Global_reactive_power=as.numeric(paste(dataset$Global_reactive_power))
#convert sub_meterings into numeric data
dataset$Sub_metering_1=as.numeric(paste(dataset$Sub_metering_1))
dataset$Sub_metering_2=as.numeric(paste(dataset$Sub_metering_2))
dataset$Sub_metering_3=as.numeric(paste(dataset$Sub_metering_3))
#setting par to draw 4 graphs in a single screen
# open a file
png(file="plot4.png")
par(mfcol=c(2,2))
# 1st graph
plot(strptime(dataset$Timestamp,"%d/%m/%Y %H:%M:%S"),dataset$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab=" ")
#second graph with lines and legend
plot(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"),dataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"),dataset$Sub_metering_2, type = "l",col="red")
lines(strptime(dataset$Timestamp, "%d/%m/%Y %H:%M:%S"), dataset$Sub_metering_3, type = "l",col="blue")
legend("topright",lty=1,col=c("Black","red","blue"),legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#graph three
plot(strptime(dataset$Timestamp,"%d/%m/%Y %H:%M:%S"),as.numeric(paste(dataset$Voltage)),type="l",xlab="datetime",ylab="Voltage")
#graph 4
plot(strptime(dataset$Timestamp,"%d/%m/%Y %H:%M:%S"),as.numeric(paste(dataset$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

