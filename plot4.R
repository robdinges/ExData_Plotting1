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

# plot 4
png('plot4.png', 
    width = 480, 
    height = 480)
par(mfrow=c(2,2))

# top left
plot(c$Global_active_power, 
     type = "l", 
     xlab="", 
     ylab="Global Active Power")

# top right
plot(c$Datum, c$Voltage, 
     type = "l", 
     xlab="date_time", 
     ylab = "Voltage")

# bottom left
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
       box.lty=0, 
       inset=.02, 
       lty=c(1,1,1), 
       cex=0.5)

# bottom right
with(c, plot(Datum, Global_reactive_power, 
             type = "l", 
             xlab="date_time"))
dev.off()


