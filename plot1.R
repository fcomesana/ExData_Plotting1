plot1 <- function() {
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "download.zip")
    unzip("download.zip")
    
    data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
    data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
    
    png("plot1.png", 480, 480)
    with(data, hist(Global_active_power, col = "red", main = "Global active power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
    dev.off()
    
}