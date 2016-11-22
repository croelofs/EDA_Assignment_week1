# download and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "download.zip")
unzip("download.zip")
hhpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
hhpc <- subset(hhpc, ( Date == "1/2/2007" | Date == "2/2/2007") )
# convert dates and times
datetimes <- strptime(paste(hhpc$Date, hhpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Make plot 2
plot(datetimes,hhpc$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
