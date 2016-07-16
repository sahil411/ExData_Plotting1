datafile <- "C:\\Users\\winchesters\\Documents\\household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
DateAndTime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
Voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DateAndTime, GlobalActivePower, type="l", ylab="Global Active Power", cex=0.2)
plot(DateAndTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

plot(DateAndTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateAndTime, subMetering2, type="l", col="red")
lines(DateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

dev.off()
