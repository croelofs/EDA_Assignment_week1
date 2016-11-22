# download and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "download.zip")
unzip("download.zip")
hhpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
hhpc <- subset(hhpc, ( Date == "1/2/2007" | Date == "2/2/2007") )

# Make plot 1
hist(hhpc$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
