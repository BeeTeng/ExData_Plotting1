
df <-  read.csv("C:/Coursera/household_power_consumption.txt", sep = ";")
nrow(df)
ncol(df)

df$Date <- as.Date(df$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

df2 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")



## ## Plot 4

df2$Voltage <- as.numeric(as.character(df2$Voltage))
df2$Global_reactive_power <- as.numeric(as.character(df2$Global_reactive_power))

library(datasets)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

with(df2, {
  plot(Global_active_power~Datetime, type = "l", xlab = "", ylab="Global Active Power")
  plot(Voltage~Datetime, type = "l", xlab = "datetime", ylab="Voltage")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
  legend("topright", col=c("black","red","blue"),lty=1, lwd=2, bty="n",legend=(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
  plot(Global_reactive_power~Datetime, type = "l", xlab = "datetime", ylab="Global_reactive_power")
})


