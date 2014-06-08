# plot1.R
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
##
## Plot #1
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, family = "", restoreConsole = TRUE)
hist((as.numeric(DataSubSet$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")
dev.off()