valueTable <- read.csv("C:/Users/amend/Desktop/household_power_consumption.txt", 
				header = TRUE, sep = ';', na.strings = "?")
values <- subset(valueTable, Date %in% cbind("1/2/2007", "2/2/2007"))
values$datetime <- as.POSIXct(strptime(paste(values$Date, values$Time), 
					format = "%d/%m/%Y %H:%M:%S"))
png("plot3.png", width = 480, height = 480)
plot(values$Sub_metering_1~values$datetime, type = "l",
      xlab = "", ylab = "Energy sub metering")
lines(values$Sub_metering_2~values$datetime, col = 'Red')
lines(values$Sub_metering_3~values$datetime, col = 'Blue')
legend("topright", lty = 1, lwd = 2, col = cbind("black", "red", "blue"),
	legend = cbind("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()