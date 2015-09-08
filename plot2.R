gap <- read.csv("household_power_consumption.txt", header=T, sep=";")
gap$Date <- as.Date(gap$Date, format="%d/%m/%Y")
df <- gap[(gap$Date=="2007-02-01") | (gap$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()