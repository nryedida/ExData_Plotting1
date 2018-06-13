hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc_df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]
hpc_df$x <- strptime(paste(hpc_df$Date, hpc_df$Time), "%Y-%m-%d %H:%M:%S")
plot(hpc_df$x, hpc_df$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()