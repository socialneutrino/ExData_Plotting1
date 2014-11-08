##This is how the data is processed before creating the base plots
powerdata <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?")
Feb07 <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
Feb07$DateAndTime <- paste(Feb07$Date, Feb07$Time)
PowerData <- subset(Feb07, select = 3:10)
