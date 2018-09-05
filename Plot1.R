#Load Data From the File
dataFile <- "household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Filter and Convert Data
data <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
#Plot 1

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
