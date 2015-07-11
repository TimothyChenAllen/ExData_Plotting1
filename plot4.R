### A. Obtain the data ###
# 1) Download the zipfile from the URL and unzip it
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
consumptionZip <- "consumption.zip"
consumptionFile <- "household_power_consumption.txt"

# If I haven't already, download the file
if (!file.exists(file="consumption.zip")) {
  download.file(url=dataURL, destfile="consumption.zip", 
                method="internal", mode="wb")
  date.loaded <- Sys.Date()
}

# If necessary, unzip the zipfile
if (!file.exists(file=consumptionFile)) {
  unzip(zipfile=consumptionZip, files=consumptionFile , unzip="internal")
}

# 2) read and View just the data we need into a data.table
require(data.table)
# Read just the column names
consumptionHeader <- colnames(fread(consumptionFile, header=TRUE, nrows=1))
# Read just 2007-02-01 and 2007-02-02
consumption <- fread(consumptionFile, 
                     skip=66637, nrows=2880, showProgress=TRUE)
# Change the column names
setnames(consumption, old=1:9, new=consumptionHeader)


### B. Clean the data ###
# 1) Correct the type of the Date field, and create a DateTime field
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
DateTime <- as.POSIXct(paste(consumption$Date,consumption$Time),
                       format="%Y-%m-%d %H:%M:%S")
consumption$datetime <- DateTime

# 2) Correct missing values from ? to NA
consumption[consumption$Global_active_power=="?",]$Global_active_power <- NA
consumption[consumption$Global_reactive_power=="?",]$Global_reactive_power <- NA
consumption[consumption$Sub_metering_1=="?",]$Sub_metering_1 <- NA
consumption[consumption$Sub_metering_2=="?",]$Sub_metering_2 <- NA
consumption[consumption$Sub_metering_3=="?",]$Sub_metering_3 <- NA
consumption[consumption$Voltage=="?",]$Voltage <- NA

### C. Plot the data ###
# Allow 2 x 2 plots
par(mfrow=c(2,2))

# 1) Construct the four plots
### Explore the Global active power with a line plot ###
plot(consumption$datetime, consumption$Global_active_power, typ="l",
     ylab="Global Active Power (kilowatts)", xlab="")

### Explore Voltage with a line plot ###
plot(consumption$datetime, consumption$Voltage, typ="l",
     ylab="Voltage", xlab="datetime")

### Explore the sub_metering consumption with line plots ###
plot(consumption$datetime, consumption$Sub_metering_1, typ="l",
     ylab="Energy sub metering", xlab="", col="black")
lines(consumption$datetime, consumption$Sub_metering_2, typ="l", col="red")
lines(consumption$datetime, consumption$Sub_metering_3, typ="l", col="blue")
legend(x="topright", legend=paste("Sub_metering_",1:3,sep=""), lty=1, 
       bty="n", col=c("black","red","blue"), cex=.7)

### Explore the Global reactive power with a line plot ###
plot(consumption$datetime, consumption$Global_reactive_power, typ="l",
     ylab="Global_reactive_power", xlab="datetime")

# 2) and save it to a PNG file with a 
# width of 480 pixels and a height of 480 pixels.
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()