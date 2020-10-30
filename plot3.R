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



# plot 3
png('plot3.png', width = 480, height = 480)
plot(c$Datum,c$Sub_metering_1, 
     type = "n", 
     xlab="", 
     ylab = "Energy sub metering")
lines(c$Datum,c$Sub_metering_1)
lines(c$Datum,c$Sub_metering_2, col="red")
lines(c$Datum,c$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "green"), 
       lty=c(1,1,1), 
       cex=0.5)
dev.off()

