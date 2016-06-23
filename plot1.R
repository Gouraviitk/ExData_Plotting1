data<-read.csv("household_power_consumption.txt",sep=";")
dataset<-data[as.character(data[,1])=="1/2/2007"|as.character(data[,1])=="2/2/2007",]
png(file="plot1.png")
hist(as.numeric(paste(dataset[,3])),col='red',main="Global Active Power",xlab="Global Active Power(kilowatts)",ylim=c(0,1200))
dev.off()
