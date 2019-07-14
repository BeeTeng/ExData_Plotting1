
df <-  read.csv("C:/Coursera/household_power_consumption.txt", sep = ";")
nrow(df)
ncol(df)

df$Date <- as.Date(df$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

df2 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")



## ## Plot 2

plot(df2$Datetime, df2$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")

