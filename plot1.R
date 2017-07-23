valueTable <- read.csv("C:/Users/amend/Desktop/household_power_consumption.txt", 
				header = TRUE, sep = ';', na.strings = "?")
values <- subset(valueTable, Date %in% cbind("1/2/2007", "2/2/2007"))
values$Date <- as.Date(values$Date, format = "%d/%m/%Y")
png("plot1.png", width = 480, height = 480)
hist(values$Global_active_power, main = "Global Active Power", col = "Red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()