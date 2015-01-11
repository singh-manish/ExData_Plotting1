library(data.table)

readPlotData <- function(filename) {
    dataSet <- read.csv(filename, header=TRUE, sep=";",na.strings="?")
    dataSet$Date <- as.Date(dataSet$Date,"%d/%m/%Y")
    dataSet <- subset(dataSet, Date >= "2007-02-01")
    dataSet <- subset(dataSet, Date <= "2007-02-02")    
    return(dataSet)
}

drawPlot <- function(dataSet, filename) {
    
png(file = filename) ## device to create png file
## Create plot and send to a file 
hist(dataSet$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() ## Close the file device

}
