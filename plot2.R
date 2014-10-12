
## Read data from text file
powerdata <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?")

## Subset data to only dates 1/2/2007 to 2/2/2007
Feb07 <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
## Merge Date and Time Columns and convert to POSIXlt date and time format
Feb07$DateAndTime <- paste(Feb07$Date, Feb07$Time)
PowerData <- subset(Feb07, select = 3:10)
PowerData$DateAndTime <- strptime(PowerData$DateAndTime, "%d/%m/%Y %H:%M:%S")
## 
png(file = "plot2.png", width = 480, height = 480)

ith(PowerData, plot(DateAndTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.off()