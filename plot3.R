plot3 <- function() {
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "download.zip")
    unzip("download.zip")
    
    data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
    data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
    data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
    
    data$DT <- paste(data$Date, data$Time, sep = " ")
    data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
    
    png("plot3.png", 480, 480)
    with(data, plot(DT, Sub_metering_1, type = "n", xlab = "Date", ylab = "Energy sub metering"))
    with(data, lines(DT, Sub_metering_1, col = "black"))
    with(data, lines(DT, Sub_metering_2, col = "red"))
    with(data, lines(DT, Sub_metering_3, col = "blue"))
    legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lwd = "1", col = c("black", "red", "blue"))
    dev.off()
    
}