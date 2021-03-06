plot1 <- function(){
  
  #pre-process of data
  raw_data <- read.csv2("household_power_consumption.txt",na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F)
  raw_data[,1] <- as.Date(raw_data[,1], format="%d/%m/%Y")  
  extracted_data <- subset(raw_data, subset=(raw_data[,1] >= "2007-02-01" & raw_data[,1] <= "2007-02-02"))  
  Date_Time <- as.POSIXct(paste(as.Date(extracted_data[,1]), extracted_data[,2]))
  new_data <- cbind(extracted_data,Date_Time)
  
  #construct plot1 output
  hist(as.numeric(new_data[,3]), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
}