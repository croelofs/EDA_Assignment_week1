# download and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "download.zip")
unzip("download.zip")
hhpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
hhpc <- subset(hhpc, ( Date == "1/2/2007" | Date == "2/2/2007") )
# convert dates and times
datetimes <- strptime(paste(hhpc$Date, hhpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Make plot 3
plot(datetimes,hhpc$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub meterings")
lines(datetimes,hhpc$Sub_metering_2, col = "red")
lines(datetimes,hhpc$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = names(hhpc[,7:9]))

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()