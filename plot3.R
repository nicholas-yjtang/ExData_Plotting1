#======================
#@author Nicholas Tang
#======================

#check if our read_data function exists, if it does not, source it
#see the read_data.R file for the code on reading the data
if(!exists("read_data", mode="function")) source("read_data.R")

#we make an assumption that the data file is located in this location
filename <- "./data/household_power_consumption.txt"

#read the file, and set the corresponding data.frame object into DF
DF <- read_data(filename)

#we use with, to make it more convenient and readable
with (DF, {
	#plot the first graph
	#Date_Time - The x-axis, the date_time column we created
	#Sub_metering_1 - The y-axis, the Sub_metering_1 column in our data
      #ylab="Energy sub metering" - label the y-axis Energy sub metering
	plot (Date_Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

	#plot the lines of Date_Time vs Sub_metering_2
	#col="red" - set the colour as red
	lines(Date_Time, Sub_metering_2, col="red")

	#plot the lines of Date_Time vs Sub_metering_3
	#col="blue" - set the colour as blue
	lines(Date_Time, Sub_metering_3, col="blue")

	#create the legend for this plot
	#"topright" - the location being the topright corner of the graph
	#lty=1 - the line type, being a full line
	#col=c("black", "red", "blue") - the colour of the lines for our legend.
	#					   we follow the same order as our plot
	#					   creation
	#legend = c("Sub_metering_1", 
	#		"Sub_metering_2",
	#		"Sub_metering_3")) - the text for our legends
	#cex=1.4 - adjustment so that our png turns out okay
	legend("topright", 
		lty=1, 
		lwd=3, 
		col=c("black", "red", "blue"), 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		cex=1.4
		)
})

#make sure we copy to png. default width and heigh is already 480x480
dev.copy(png, width=480, height=480, file="plot3.png")

#make sure to switch off the png device
dev.off()
