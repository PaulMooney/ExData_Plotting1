#To be run from the orking directory with a Data subfolder holding the
#household_power_consumption.txt data file.

#Load the data
AllData <- read.table(file = "Data\\household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")

#Filter what we need
DataSub <- AllData[AllData$Date == "1/2/2007" | AllData$Date == "2/2/2007",]
#Free up memory
rm(AllData)

#Fix up the dates
DataSub$Date <-as.POSIXct(paste(DataSub$Date,DataSub$Time), format="%d/%m/%Y %H:%M:%S")

#PLOT 02 - 
plot(DataSub$Date,DataSub$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)", main = "", xlab = "")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
