#Load Data From the File
dataFile <- "household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Filter and Convert Data
data <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$datetime <- paste(data$Date, data$Time,sep = " ")
data$datetime<- strptime(data$datetime,"%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

#Plot 3

plot(data$Sub_metering_1 ~ data$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, type = "l", col="red")
lines(data$Sub_metering_3 ~ data$datetime, type = "l", col="blue")

legend("topright", col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()