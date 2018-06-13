hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc_df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]
hpc_df$x <- strptime(paste(hpc_df$Date, hpc_df$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(hpc_df$x, hpc_df$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(hpc_df$x, hpc_df$Sub_metering_2, type="l", col = "red")
lines(hpc_df$x, hpc_df$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","blue","red"), lwd = 2, lty = 1)

dev.off()