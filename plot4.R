#======================
#@author Nicholas Tang
#======================

#check if our read_data function exists, if it does not, source it
if(!exists("read_data", mode="function")) source("read_data.R")

#we make an assumption that the data file is located in this location
filename <- "./data/household_power_consumption.txt"

#read the file, and set the corresponding data.frame object into DF
DF <- read_data(filename)

#set the par value
#mfrow = c(2, 2) - 2x2 plots (total 4), row-wise
#mar = c(4, 4, 2, 1) - set the margins between each plots
#omar = c(0, 0, 2, 0)) - set the overall margins of the 4 plots together
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#check if our read_data function exists, if it does not, source it
#if(!exists("read_data", mode="function")) source("read_data.R")

#we make an assumption that the data file is located in this location
#filename <- "./data/household_power_consumption.txt"

#read the file, and set the corresponding data.frame object into DF
#DF <- read_data(filename)

#we use with, to make it more convenient and readable
with (DF, {
	#plot the first graph, same as plot2.R, except some changes in the y-axis label
      plot (Date_Time, Global_active_power, type="l", ylab="Global Active Power", xlab="")

	#plot the 2nd graph, Date_Time vs Voltage
	#type="l" - set the line type
	#ylab="Voltage" - set the y axis label to be Voltage
	#xlab="datetime" - set the x axis label to be datetime
      plot (Date_Time, Voltage, type="l", ylab="Voltage", xlab="datetime")

	#plot the 3rd graph, Date_Time vs Sub_metering, same as plot3.R
      plot (Date_Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
      lines(Date_Time, Sub_metering_2, col="red")
      lines(Date_Time, Sub_metering_3, col="blue")    
      legend("topright", lty=c(1,1), 
		col=c("black", "red", "blue"), 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		#some differece from plot3.r
		#bty = "n" - we remove the bounding box for the legend
		#inset = c(0.08,0) - we need to adjust the position of the legend
		#		         to compensate for the difference in png
		bty = "n",
		inset = c(0.08,0)
	)

	#plot the 4th graph, Date_Time vs Global_reactive_power
	#type="l" - set the line type
	#xlab="datetime" - set the x axis label to be datetime
	#ylab="Global_reactive_power" - set the y axis labl to Global_reactive_power
      plot (Date_Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
      })

#make sure we copy to png. default width and heigh is already 480x480
dev.copy(png, width=480, height=480, file="plot4.png")

#make sure to switch off the png device
dev.off()
