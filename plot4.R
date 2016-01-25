# plot4.R
setwd("/Users/rney/JHR/class4/week1/ExData_Plotting1")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data1.zip", method="curl")
hpc <- read.csv("../household_power_consumption.txt",sep=';',na.strings="?")

# convert date
hpc$Date <- as.Date(as.Date(hpc$Date, format="%d/%m/%Y"))
# subset for date range
hpc3 <- subset(hpc,Date=="2007-02-01" | Date=="2007-02-02")
# select one field
gap <- hpc3$Global_active_power
# merge date and time
hpc3$datetime <- as.POSIXct(paste(hpc3$Date, hpc3$Time), format="%Y-%m-%d %H:%M:%S")

# set up 4 graphs
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# plot 1st plot
plot(Global_active_power ~ newdate, data=hpc3,type="l", ylab="Global Active Power",xlab="")
# plot 2nd plot
plot(Voltage ~ datetime, data=hpc3, type="l")
# plot 3rd plot
plot(Sub_metering_1 ~ newdate, ylab="Energy sub metering",xlab="",data=hpc3, type="n")
points(hpc3$datetime, hpc3$Sub_metering_1, col="black", type="l")
points(hpc3$datetime, hpc3$Sub_metering_2, col="red", type="l")
points(hpc3$datetime, hpc3$Sub_metering_3, col="blue", type="l")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,bty="n")
# plot 4th plot
plot(Global_reactive_power ~ datetime, data=hpc3, type="l")
dev.off()
