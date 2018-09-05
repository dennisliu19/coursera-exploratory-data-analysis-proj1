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

#Plot 1

plot(data$Global_active_power ~ data$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
