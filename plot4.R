hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc_df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]
hpc_df$x <- strptime(paste(hpc_df$Date, hpc_df$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(hpc_df$x, hpc_df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(hpc_df$x, hpc_df$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
# axis(2, at=seq(234, 246, 6))


plot(hpc_df$x, hpc_df$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(hpc_df$x, hpc_df$Sub_metering_2, type="l", col = "red")
lines(hpc_df$x, hpc_df$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","blue","red"), lwd = 2, lty = 1)

plot(hpc_df$x, hpc_df$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()