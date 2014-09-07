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

#create the actual plot using hist
#DF$Global_active_power - the target is the Global_active_power column
#col="red" - set the colour as red as indicated
#main="Global Active Power" - set the title as Global Active Power
#xlab="Global Active Power (kilowatts) - set the x axis label as Global Active Power (kilowatts)
hist(DF$Global_active_power, 
	col="red", 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)")

#make sure we copy to png. default width and heigh is already 480x480
dev.copy(png, width=480, height=480, file="plot1.png")

#make sure to switch off the png device
dev.off()
