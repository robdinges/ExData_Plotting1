library(lubridate)
library(dplyr)

# getting the data ready
a <- read.csv('household_power_consumption.txt', sep=';')
b <- subset(a, dmy(Date) >= ymd("2007-02-01") & dmy(Date) <= ymd("2007-02-02") )
c <- type.convert(b)
c$Date <- dmy(c$Date)
c$Time <- hms(c$Time)
c <- na.omit(c)
c$Datum <- c$Date + c$Time


# plot 1
png('plot1.png', width = 480, height = 480)
hist(c$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
