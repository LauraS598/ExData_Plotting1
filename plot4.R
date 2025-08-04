# plot4.R

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)

# Convert and filter dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Combine Date and Time into datetime
datetime <- strptime(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")

# Create PNG file
png("plot4.png", width=480, height=480)

# Set up 2x2 layout
par(mfrow = c(2, 2))

# Top-left: Global Active Power
plot(datetime, subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Top-right: Voltage over time
plot(datetime, subset$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Bottom-left: Energy sub-metering (same as plot3)
plot(datetime, subset$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(datetime, subset$Sub_metering_2, col="red")
lines(datetime, subset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n", cex=0.8)

# Bottom-right: Global Reactive Power
plot(datetime, subset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

dev.off()