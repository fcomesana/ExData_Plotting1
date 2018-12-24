plot2 <- function() {
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "download.zip")
    unzip("download.zip")
    
    data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
    data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
    data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
    
    data$DT <- paste(data$Date, data$Time, sep = " ")
    data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
    
    png("plot2.png", 480, 480)
    with(data, plot(DT, Global_active_power, type = "l", xlab = "Date", ylab = "Global Active Power (kilowatts)"))
    dev.off()
    
}