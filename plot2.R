#======================
#@author Nicholas Tang
#======================

#check if our read_data function exists, if it does not, source it
if(!exists("read_data", mode="function")) source("read_data.R")

#we make an assumption that the data file is located in this location
filename <- "./data/household_power_consumption.txt"

#read the file, and set the corresponding data.frame object into DF
DF <- read_data(filename)

#create the actual plot with the plot command
#DF$Date_Time - x-axis, the date_time column created through our read_data function
#DF$Global_active_power - y-axis, our global_active_power column
#type = "l" - make sure the type is line, so that it will draw the line plots correctly
#ylab="Global Active Power (kilowatts)" - label the y axis Global Active Power (kilowatts)
#xlab="" - remove the default x axis label
plot (DF$Date_Time, DF$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#make sure we copy to png. default width and heigh is already 480x480
dev.copy(png, file="plot2.png")

#make sure to switch off the png device
dev.off()