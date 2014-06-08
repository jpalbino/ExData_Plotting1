## Introduction

This assignment uses data from the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine Learning Repository</a>, a popular repository for machine learning datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on the course web site:

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


Loading the datase:
The full dataset (2,075,259 rows and 9 columns) are loaded once a time. It will spend some time in the machine.
In my case, I loaded the file using Windows 7 and a notebook Vaio with 8 MB of memory.
In any case, the R scripts here assume that the file is downloaded and unzipped in a local directory!

The code is: DataSet <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Rem This file needs "correcting" the Date and time columns for usual formating: DataSet$Date <- as.Date(DataSet$Date, format="%d/%m/%Y")

For logical use in our scripts the full data set need to be subset. We select data from the dates 2007-02-01 and 2007-02-02: DataSubSet<- subset(DataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

After that we can construct our R scripts for plotting the data.

All plotting script are self described in the file.
