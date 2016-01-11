# Create Plot 4

# Load in the original data and subset to the required days.
# The original datafile was not pushed to Github due to its size.
data1 <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
data2 <- subset(data1, data1$Date == "1/2/2007" | data1$Date == "2/2/2007")

# Create a datetime value from the separate Date and Time character values
data2$Datetime <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

# Convert character values to numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)
data2$Voltage <- as.numeric(data2$Voltage)
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

# Open PNG file and set multiple plot format
png("plot4.png")
par(mfrow = c(2, 2))

# Plot 1
with(data2, plot(Datetime, Global_active_power,
                 type = "l",
                 ylab = "Global Active Power",
                 xlab = ""))

# Plot 2
with(data2, plot(Datetime, Voltage,
                 type = "l",
                 xlab = "datetime"))

# Plot 3
with(data2, plot(Datetime, Sub_metering_1, col = "black",
                 type = "l",
                 ylab = "Energy sub metering",
                 xlab = "",
                 main = ""))
with(data2, lines(Datetime, Sub_metering_2, col = "red"))
with(data2, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright",
       bty = "n",
       lwd = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
with(data2, plot(Datetime, Global_reactive_power,
                 type = "l",
                 xlab = "datetime"))

# Close PNG File
dev.off()
