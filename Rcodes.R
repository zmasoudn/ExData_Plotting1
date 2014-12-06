## loading data
setwd("C:/Users/Zeynab/Desktop")
data<- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Only using data from the dates 2007-02-01 and 2007-02-
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creating first plot
setwd("C:/Users/Zeynab/Documents/ExData_Plotting1")
png("plot1.png", width = 480, height = 480)

hist(as.numeric(subdata$Global_active_power), 
     col="red", 
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

## creating second plot
png("plot2.png", width = 480, height = 480)

newdate <- as.character(as.Date(subdata$Date, "%d/%m/%Y"))
newtime <- strptime(paste(newdate, subdata$Time), "%Y-%m-%d %H:%M:%S")

plot(newtime, as.numeric(subdata$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

## creating third plot
png("plot3.png", width = 480, height = 480)     
plot(newtime, as.numeric(subdata$Sub_metering_1), 
     type="l",
     ylab="Energy Submetering", 
     xlab="")
lines(newtime, as.numeric(subdata$Sub_metering_2), 
      type="l", 
      col="red")
lines(newtime, as.numeric(subdata$Sub_metering_3), 
      type="l", 
      col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       lwd =2.5, 
       col=c("black", "red", "blue"))

dev.off()


## creating fourth plot
png("plot4.png", width = 480, height = 480)   
par(mfrow = c(2, 2)) 

#First part
plot(newtime, as.numeric(subdata$Global_active_power), 
     type="l",
     ylab="Global Active Power", 
     xlab="")

#Second part
plot(newtime, as.numeric(subdata$Voltage), 
     type="l",
     ylab="Voltage", 
     xlab="datetime")

#Third part
plot(newtime, as.numeric(subdata$Sub_metering_1), 
     type="l",
     ylab="Energy Submetering", 
     xlab="")
lines(newtime, as.numeric(subdataubdata$Sub_metering_2), 
      type="l", 
      col="red")
lines(newtime, as.numeric(subdata$Sub_metering_3), 
      type="l", 
      col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd =2.5,
       col=c("black", "red", "blue"), bty = "n")

#Fourth part
plot(newtime, as.numeric(subdata$Global_reactive_power), 
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
