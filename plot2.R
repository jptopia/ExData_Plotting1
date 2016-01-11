# Create Plot 2

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

# Open PNG file and set single plot format
png("plot2.png")
par(mfrow = c(1,1))

# Plot 2
with(data2, plot(Datetime, Global_active_power,
                 type = "l",
                 ylab = "Global Active Power (kilowatts)",
                 xlab = ""))

# Close PNG file
dev.off()
