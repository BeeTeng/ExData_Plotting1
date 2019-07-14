
df <-  read.csv("C:/Coursera/household_power_consumption.txt", sep = ";")
nrow(df)
ncol(df)

df$Date <- as.Date(df$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

df2 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")



## ## Plot 3

df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))


library(datasets)

par(mfrow = c(1, 1))

with(df2, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
  legend("topright", col=c("black","red","blue"),lty=1, lwd=2,legend=(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
})

