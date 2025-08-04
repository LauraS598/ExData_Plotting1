plot3.R

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)

# Convert and filter dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Combine Date and Time into datetime
datetime <- strptime(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")

# Create the PNG
png("plot3.png", width=480, height=480)

# Plot Sub_metering_1
plot(datetime, subset$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")

# Add Sub_metering_2 and Sub_metering_3
lines(datetime, subset$Sub_metering_2, col="red")
lines(datetime, subset$Sub_metering_3, col="blue")

# Add Legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

dev.off()