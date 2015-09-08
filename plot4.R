gap <- read.csv("household_power_consumption.txt", header=T, sep=";")
gap$Date <- as.Date(gap$Date, format="%d/%m/%Y")
df <- gap[(gap$Date=="2007-02-01") | (gap$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))

par(mfrow=c(2,2))
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1, bty="n", cex=.4)

plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()