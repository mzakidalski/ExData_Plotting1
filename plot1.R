setwd("C:/Users/Marcin/Desktop/ExploratoryDataAnalysis/ExData_Plotting1")
fileName <- "household_power_consumption.txt"

data <- read.csv(fileName, header = TRUE, sep=";", stringsAsFactors = FALSE,
                         na.strings = "?",
                         colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                        "numeric","numeric","numeric"))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data[,c("DateTime")] <- paste0(data[,c("Date")]," ",data[,c("Time")])
data[, c("Date")] <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(x <- as.character(data$Time), format <- "%H:%M:%S")
data$DateTime <- strptime(x <- as.character(data$DateTime), format <- "%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


