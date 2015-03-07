# install.packages("data.table")
library(data.table)
data <- fread("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Use only data from dates 2007-02-01 and 2007-02-02
data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02"]

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename="plot1.png", height=480, width=480)
hist(data$Global_active_power, main="Global Active Power",
     col="#ff2500", xlab="Global Active Power (kilowatts)")
dev.off()