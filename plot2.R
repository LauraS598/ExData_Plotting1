# plot2.R

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)

# Convert and filter dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Combine Date and Time into a single datetime object
datetime <- strptime(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")

# Plot
png("plot2.png", width=480, height=480)
plot(datetime, subset$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()