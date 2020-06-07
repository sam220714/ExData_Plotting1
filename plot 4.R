# switching to directory where the file "household_power_consumption.txt" is located


data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = T, stringsAsFactors = F)

data_extract <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

date_time <- strptime(paste(data_extract$Date, data_extract$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

Global_active_power <- as.numeric(data_extract$Global_active_power)

Voltage <- as.numeric(data_extract$Voltage)

global_reactive_power <- as.numeric(data_extract$Global_reactive_power)

plot(date_time, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# for third plot of submetering

sub_metering_1 <- as.numeric(data_extract$Sub_metering_1)
sub_metering_2 <- as.numeric(data_extract$Sub_metering_2)
sub_metering_3 <- as.numeric(data_extract$Sub_metering_3)

plot(date_time, sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering")

lines(date_time, sub_metering_1, col = "black")
lines(date_time, sub_metering_2, col = "red")
lines(date_time, sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#

plot(date_time, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_Reactive_power")





dev.off()

