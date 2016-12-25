setwd("C:/Users/Marcin/Desktop/ExploratoryDataAnalysis/ExData_Plotting1")
fileName <- "household_power_consumption.txt"
Sys.setlocale("LC_ALL", "English")
Sys.setenv("LANGUAGE"="En")

data <- read.csv(fileName, header = TRUE, sep=";", stringsAsFactors = FALSE,
                         na.strings = "?",
                         colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                        "numeric","numeric","numeric"))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data[,c("DateTime")] <- paste0(data[,c("Date")]," ",data[,c("Time")])
data[, c("Date")] <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(x <- as.character(data$Time), format <- "%H:%M:%S")
data$DateTime <- strptime(x <- as.character(data$DateTime), format <- "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(data$DateTime,data$Sub_metering_1, xlab="", ylab="Energy sub metering", typ = "l", col="black")
lines(data$DateTime, data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3, col="blue")
legend("topright",  lwd =1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

