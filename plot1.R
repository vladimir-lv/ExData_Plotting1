library(lubridate)
#read file from working directory
epcdata<-read.csv("household_power_consumption.txt",sep=";",
                  colClasses=c("character","character","character","character","character",
                               "character","character","character","character")
)

epcdata0207<-epcdata[dmy(epcdata$Date) >= dmy("01/02/2007") & dmy(epcdata$Date) < dmy("03/02/2007"),]
rm(epcdata)

epcdata0207$Global_active_power<-as.numeric(epcdata0207$Global_active_power)

png("plot1.png",width = 480, height = 480, units = "px")
hist(epcdata0207$Global_active_power,col='red', freq=TRUE,
      main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
