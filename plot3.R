plot3 <- function(){
  
  #pre-process of data
  raw_data <- read.csv2("household_power_consumption.txt",na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F)
  raw_data[,1] <- as.Date(raw_data[,1], format="%d/%m/%Y")  
  extracted_data <- subset(raw_data, subset=(raw_data[,1] >= "2007-02-01" & raw_data[,1] <= "2007-02-02"))  
  Date_Time <- as.POSIXct(paste(as.Date(extracted_data[,1]), extracted_data[,2]))
  new_data <- cbind(extracted_data,Date_Time)
  
  #construct plot3 output
  plot(as.numeric(new_data[,7])~new_data[,10], type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(as.numeric(new_data[,8])~new_data[,10],col='Red')
  lines(as.numeric(new_data[,9])~new_data[,10],col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, pt.cex=1)
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
}