# plot2.R
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
hpc3$newdate <- as.POSIXct(paste(hpc3$Date, hpc3$Time), format="%Y-%m-%d %H:%M:%S")
# plot graph
png(filename="plot2.png",width=480,height=480)
plot(Global_active_power ~ newdate, data=hpc3,type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
