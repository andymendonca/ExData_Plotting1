valueTable <- read.csv("C:/Users/amend/Desktop/household_power_consumption.txt", 
				header = TRUE, sep = ';', na.strings = "?")
values <- subset(valueTable, Date %in% cbind("1/2/2007", "2/2/2007"))
values$datetime <- as.POSIXct(strptime(paste(values$Date, values$Time), 
					format = "%d/%m/%Y %H:%M:%S"))
png("plot2.png", width = 480, height = 480)
plot(values$Global_active_power~values$datetime, type = "l",
      xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()