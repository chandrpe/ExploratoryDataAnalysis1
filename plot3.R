###path of the dataset
dataFile <- "C:/Users/ACE/Desktop/household_power_consumption.txt"

###extract the dataset
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

###strip date and time to get required information
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datadatetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

###get all required values
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

###create a file
png("plot3.png", width=480, height=480)

###make a plot
plot(datadatetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datadatetime, subMetering2, type="l", col="red")
lines(datadatetime, subMetering3, type="l", col="blue")

###to highlight the values on the topright of the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

###close the device
dev.off()
 