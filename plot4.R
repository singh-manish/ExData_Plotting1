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

    par(mfrow = c(2, 2))

    with(DT, {
        
        xLength <- length(DT$Global_active_power)
        plot(1:xLength,DT$Global_active_power,type="l", lty = 1, main = "", ylab = "Global Active Power", xlab = "", xaxt = "n")
        axis(1,at=c(1,round(xLength/2),xLength), labels=c("Thu","Fri","Sat"))   

        xLength <- length(DT$Voltage)
        plot(1:xLength,DT$Voltage,type="l", lty = 1, main = "", ylab = "Voltage", xlab = "datetime", xaxt = "n")
        axis(1,at=c(1,round(xLength/2),xLength), labels=c("Thu","Fri","Sat"))   
        
        xLength <- length(DT$Sub_metering_1)    
        plot(1:xLength,DT$Sub_metering_1,type="l", lty = 1, main = "", ylab = "Energy Sub Metering", xlab = "", xaxt = "n")
        lines(1:xLength,DT$Sub_metering_2,lty = 1,col="red",xlab = "", xaxt = "n")
        lines(1:xLength,DT$Sub_metering_3,lty = 1,col="blue",xlab = "", xaxt = "n")
        axis(1,at=c(1,round(xLength/2),xLength), labels=c("Thu","Fri","Sat"))    
        legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))    
        
        xLength <- length(DT$Global_reactive_power)
        plot(1:xLength,DT$Global_reactive_power,type="l", lty = 1, main = "", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
        axis(1,at=c(1,round(xLength/2),xLength), labels=c("Thu","Fri","Sat"))   
        
    })
    dev.off() ## Close the file device
    
}