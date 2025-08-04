# plot1.R

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)

# Filter for dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Create plot
png("plot1.png", width=480, height=480)
hist(subset$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

