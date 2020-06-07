# switching to directory where the file "household_power_consumption.txt" is located


data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = T, stringsAsFactors = F)

data_extract <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

date_time <- strptime(paste(data_extract$Date, data_extract$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

with(data = data_extract, plot(date_time,as.numeric(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()