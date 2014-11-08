
##Read data from text file
powerdata <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?")

## Subset data to only dates 1/2/2007 to 2/2/2007
Feb07 <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
## Merge Date and Time Columns and convert to POSIXlt date and time format
Feb07$DateAndTime <- paste(Feb07$Date, Feb07$Time)
PowerData <- subset(Feb07, select = 3:10)
PowerData$DateAndTime <- strptime(PowerData$DateAndTime, "%d/%m/%Y %H:%M:%S")
## Open png graphics device
png(file = "plot2.png", width = 480, height = 480)
## Plot grid without series
with(PowerData, plot(DateAndTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))

##Add each Energy sub metering and Time Data separately with a different colour
points(PowerData$DateAndTime, PowerData$Sub_metering_1, type = "l", col = "black")
points(PowerData$DateAndTime, PowerData$Sub_metering_2, type = "l", col = "red")
points(PowerData$DateAndTime, PowerData$Sub_metering_3, type = "l", col = "blue")
##Add a legend
legend("topright", lty = 1, col=c("black", "red","blue"), legend = colnames(PowerData[,5:7]))

dev.off()