# switching to directory where the file "household_power_consumption.txt" is located


data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = T, stringsAsFactors = F)

data_extract <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

png("plot1.png", width = 480, height = 480)

with(data = data_extract, hist(as.numeric(Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off()