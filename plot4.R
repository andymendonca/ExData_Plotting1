valueTable <- read.csv("C:/Users/amend/Desktop/household_power_consumption.txt", 
				header = TRUE, sep = ';', na.strings = "?")
values <- subset(valueTable, Date %in% cbind("1/2/2007", "2/2/2007"))
values$datetime <- as.POSIXct(strptime(paste(values$Date, values$Time), 
					format = "%d/%m/%Y %H:%M:%S"))
png("plot4.png", width = 480, height = 480)
par(mfrow = cbind(2,2), mar = cbind(4, 4, 2, 1), oma = cbind(0, 0, 2, 0))
plot(values$Global_active_power~values$datetime, type = "l",
      xlab = "", ylab = "Global Active Power")
plot(values$Voltage~values$datetime, type = "l", 
	xlab = "datetime", ylab = "Voltage")
plot(values$Sub_metering_1~values$datetime, type = "l", 
	xlab = "", ylab = "Energy sub metering")
lines(values$Sub_metering_2~values$datetime, col = 'Red')
lines(values$Sub_metering_3~values$datetime, col = 'Blue')
legend("topright", lty = 1, lwd = 2, bty = "n", 
	col = cbind("black", "red", "blue"),
	legend = cbind("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(values$Global_reactive_power~values$datetime, type = "l",
      xlab = "datetime", ylab = "Global_reactive_power")
dev.off()