

plot3 <- function( twodays )
{
  plot( twodays$Sub_metering_1~as.POSIXct(paste(twodays$Date, twodays$Time), 
                                          format="%d/%m/%Y %H:%M:%S"), type="l", main="",
        xlab="", ylab="Energy sub metering" )
  
  points( twodays$Sub_metering_2~as.POSIXct(paste(twodays$Date, twodays$Time), 
                                            format="%d/%m/%Y %H:%M:%S"), type="l", col="red" )
  points( twodays$Sub_metering_3~as.POSIXct(paste(twodays$Date, twodays$Time), 
                                            format="%d/%m/%Y %H:%M:%S"), type="l", col="blue" )
  
  legend( "topright", lty=1,col=c("black","red","blue"),bty="n",cex=0.9,
          legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))  
}

plot4 <- function() {
  # input file should be in working directory !
  header <- read.csv( "household_power_consumption.txt", sep=";", nrows=1,header=FALSE)
  twodays <- read.csv( "household_power_consumption.txt", sep=";" , skip=66636,nrows=2880,
                       na.string="?")
  names(twodays) <- header
  
  png("plot4.png",width = 480, height = 480, units = "px")
  par(mfcol = c(2,2))
  
  # Topleft, same as plot2
  plot( twodays$Global_active_power~as.POSIXct(paste(twodays$Date, twodays$Time), 
      format="%d/%m/%Y %H:%M:%S"), type="l", main="",xlab="", ylab="Global Active Power" )

  # Bottomleft
  plot3(twodays) 
  
  # Top-right
  plot( twodays$Voltage~as.POSIXct(paste(twodays$Date, twodays$Time), 
     format="%d/%m/%Y %H:%M:%S"), type="l", main="",xlab="datetime", ylab="Voltage" )

  # Bottom-right
  plot( twodays$Global_reactive_power~as.POSIXct(paste(twodays$Date, twodays$Time), 
    format="%d/%m/%Y %H:%M:%S"), type="l", main="",xlab="datetime", ylab="Global_reactive_power" )

  dev.off()
}
