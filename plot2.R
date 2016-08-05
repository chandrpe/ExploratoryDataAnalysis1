##set the working directory
 setwd("C:/Users/ACE/Desktop")

##set the values of the dataset to variabe dataFile
 dataFile <- "C:/Users/ACE/Desktop/household_power_consumption.txt"

##read the dataFile into variable data
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##to get the values within the specified date and time
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
 datadatetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
 globalActivePower <- as.numeric(subSetData$Global_active_power) 

##to save the created plot in file plot2.png
 png("plot2.png", width=480, height=480)

##create the plot
 plot(datadatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##close the device
 dev.off() 

        