library(sqldf)
library(RCurl)
#=============================================================
#@author Nicholas Tang
#the read data function
#@filename the location of the file to 
#	read in the data file of "Individual household electric 
#	power consumption Data Set"
#==============================================================

read_data <- function(filename, url) {


  
  #we use a library called sqldf, which allows reading in of large files without
  #the required memory  
  DF <- read.csv.sql(filename, 
		         #header exists in the csv file, so this must be true
                     header=TRUE,

			   #although unnecessary, it is suppose to be faster to define the
			   #classes of the columns (R classes)
                     colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),   

			   #separator is ;, not your typical csv
                     sep=";", 

			   #using sql query to retrieve only the dates on 1/2/2007 and 2/2/2007
			   sql= "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")

  #create a new column, with the date and time from the first two columns
  DF$Date_Time <- strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")

  #return the data.frame object created
  DF
}

download_file <- function (fileUrl, destination) {  
  x <- getBinaryURL(fileUrl, ssl.verifypeer=FALSE)
  to.write = file(destination, "wb")
  writeBin(x,to.write)
  close(to.write)  
}