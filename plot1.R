setwd("C:/Users/Marcin/Desktop/ExploratoryDataAnalysis/ExData_Plotting1")
fileName <- "household_power_consumption.txt"

data <- read.csv(fileName, header = TRUE, sep=";", stringsAsFactors = FALSE,
                         na.strings = "?",
                         colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                        "numeric","numeric","numeric"))
data[,c("DateTime")] <- paste0(data[,c("Date")]," ",data[,c("Time")])
data[, c("Date")] <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(x <- as.character(data$Time), format <- "%H:%M:%S")
data$DateTime <- strptime(x <- as.character(data$DateTime), format <- "%d/%m/%Y %H:%M:%S")
sapply(data, class)
head(data)