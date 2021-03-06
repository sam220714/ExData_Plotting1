# switching to directory where the file "household_power_consumption.txt" is located


data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = T, stringsAsFactors = F)

data_extract <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

date_time <- strptime(paste(data_extract$Date, data_extract$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

sub_metering_1 <- as.numeric(data_extract$Sub_metering_1)
sub_metering_2 <- as.numeric(data_extract$Sub_metering_2)
sub_metering_3 <- as.numeric(data_extract$Sub_metering_3)

plot(date_time, sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering")

lines(date_time, sub_metering_1, col = "black")
lines(date_time, sub_metering_2, col = "red")
lines(date_time, sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()