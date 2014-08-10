#To be run from the Working directory with a Data subfolder holding the
#household_power_consumption.txt data file.

#Load the data
AllData <- read.table(file = "Data\\household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")

#Filter what we need
DataSub <- AllData[AllData$Date == "1/2/2007" | AllData$Date == "2/2/2007",]
#Free up memory
rm(AllData)

#Fix up the dates
DataSub$Date <-as.POSIXct(paste(DataSub$Date,DataSub$Time), format="%d/%m/%Y %H:%M:%S")

#PLOT 03 - 
plot(DataSub$Date,DataSub$Sub_metering_1,type = "l",ylab = "Energy sub metering", main = "", xlab = "")
lines(DataSub$Date,DataSub$Sub_metering_2,type = "l",col="red")
lines(DataSub$Date,DataSub$Sub_metering_3,type = "l",col="blue")
legend("topright",lty= c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  col=c("black","red","blue"),cex=.8)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
