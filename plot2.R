plot2 <- function() {
  header <- read.csv( "household_power_consumption.txt", sep=";", nrows=1,header=FALSE)
  twodays <- read.csv( "household_power_consumption.txt", sep=";" , skip=66636,nrows=2880,
                       na.string="?")
  names(twodays) <- header
  plot( twodays$Global_active_power~as.POSIXct(paste(twodays$Date, twodays$Time), 
            format="%d/%m/%Y %H:%M:%S"), type="l", main="",
        xlab="", ylab="Global Active Power (kilowatts)" )

  dev.copy( png, file="plot2.png",width = 480, height = 480, units = "px")
  dev.off()
}
