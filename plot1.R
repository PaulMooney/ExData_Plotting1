#To be run from the working directory with a Data subfolder holding the
#household_power_consumption.txt data file.

#Load the data
AllData <- read.table(file = "Data\\household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", sep = ";")

#Filter what we need
DataSub <- AllData[AllData$Date == "1/2/2007" | AllData$Date == "2/2/2007",]
#Free up memory
rm(AllData)

#PLOT 01 - 
hist(DataSub$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col="red" )

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
