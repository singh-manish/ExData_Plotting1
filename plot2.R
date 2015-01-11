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
    xLength <- length(DT$Global_active_power)
    plot(1:xLength,DT$Global_active_power,type="l", lty = 1, main = "", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
    axis(1,at=c(1,round(xLength/2),xLength), labels=c("Thu","Fri","Sat"))    
    dev.off() ## Close the file device
    
}