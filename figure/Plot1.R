## import the household_power_consumption data from the directory

HPCdata <- read.table("household_power_consumption.txt",
                      header=TRUE, sep=";", na.strings = "?",
                      colClasses = c('character','character',
                                     'numeric','numeric','numeric',
                                     'numeric','numeric','numeric',
                                     'numeric'))

## Format date to Type Date
HPCdata$Date <- as.Date(HPCdata$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
HPCdata <- subset(HPCdata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
HPCdata <- HPCdata[complete.cases(HPCdata),]

## Combine Date and Time column
dateTime <- paste(HPCdata$Date, HPCdata$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
HPCdata <- HPCdata[ ,!(names(HPCdata) 
                       %in% c("Date","Time"))]

## Add DateTime column
HPCdata <- cbind(dateTime, HPCdata)

## Format dateTime Column
HPCdata$dateTime <- as.POSIXct(dateTime)



## Create the histogram
hist(HPCdata$Global_active_power, 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="blue")
