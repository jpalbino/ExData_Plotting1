# plot4.R
# 
Setting up the work directory
## Note: In this script we suppose that the dataset "Electric power consumption [20Mb]" is placed in the working directory
## Note 2: In my case, my working directory is a Windows folder named "D:\A Exploratory Data Analysis\Course Project 1"
setwd("D:/A Exploratory Data Analysis/Course Project 1")
##
# Trying to read the entire file
DataSet <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## 
# "Correcting" Date and time for usual formating
DataSet$Date <- as.Date(DataSet$Date, format="%d/%m/%Y")
##
# Subsetting only using data from the dates 2007-02-01 and 2007-02-02
DataSubSet<- subset(DataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Converting dates
datetime <- paste(as.Date(DataSubSet$Date), DataSubSet$Time)
## From R Manual: Class "POSIXct" represents the (signed) number of seconds since the beginning of 1970 
## (in the UTC time zone) as a numeric vector.
DataSubSet$Datetime <- as.POSIXct(datetime)
#
## Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, family = "", restoreConsole = TRUE)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(DataSubSet$Global_active_power~DataSubSet$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(DataSubSet$Voltage~DataSubSet$Datetime, type="l", ylab="Voltage (volt)", xlab="")
plot(DataSubSet$Sub_metering_1~DataSubSet$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(DataSubSet$Sub_metering_2~DataSubSet$Datetime,col='Red')
lines(DataSubSet$Sub_metering_3~DataSubSet$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DataSubSet$Global_reactive_power~DataSubSet$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
dev.off()
