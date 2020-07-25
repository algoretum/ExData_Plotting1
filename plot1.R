
plot1 <- function() {
  header <- read.csv( "household_power_consumption.txt", sep=";", nrows=1,header=FALSE)
  twodays <- read.csv( "household_power_consumption.txt", sep=";" , skip=66636,nrows=2880)
  names(twodays) <- header
  
  hist( twodays$Global_active_power, col="red",main="Global Active Power",
        xlab="Global Active Power (kilowatts)")
  
  dev.copy( png, file="plot1.png",width = 480, height = 480, units = "px")
  dev.off()
}
