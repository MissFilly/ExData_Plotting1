# install.packages("data.table")
library(data.table)
data <- fread("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Use only data from dates 2007-02-01 and 2007-02-02
data <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02"]

# Put date and time together
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%F %T")

# The next line of code was necessary to show the names
# in English in my Linux system.
# See https://stat.ethz.ch/R-manual/R-devel/library/base/html/locales.html
# Sys.setlocale("LC_TIME", "en_US.utf8")
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

plot(datetime, data$Voltage, ylab = "Voltage", type="l")

plot(datetime, data$Sub_metering_1, type="n",
     ylab="Enery sub metering", xlab="")
lines(datetime, data$Sub_metering_1)
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"), bty="n")

plot(datetime, data$Global_reactive_power, type="l",
     ylab="Global_reactive_power")
dev.off()