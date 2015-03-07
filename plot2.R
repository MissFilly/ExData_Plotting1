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
png(file="plot2.png", width=480, height=480)
plot(datetime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()