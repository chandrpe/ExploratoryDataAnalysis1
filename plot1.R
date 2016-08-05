##get the file from which we need to retrieve information

##set the working directory 
setwd("C:/Users/ACE/Desktop")

##read the table and set the variable data
 dataFile <- "C:/Users/ACE/Desktop/household_power_consumption.txt"
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subse the data set to the required time 
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##to extract values from Global_active_power values to plot
 globalActivePower <- as.numeric(subSetData$Global_active_power)

##to copy  the plot in the file plot1.png
 png("plot1.png", width=480, height=480)

##to create a histograph 
 hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##to close the graphical device as the job is done
 dev.off()
