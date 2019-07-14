
df <-  read.csv("C:/Coursera/household_power_consumption.txt", sep = ";")
nrow(df)
ncol(df)

df$Date <- as.Date(df$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

df2 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")



## ## Plot 1

df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

hist(df2$Global_active_power, col = "red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
