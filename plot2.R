library(lubridate)
#read file from working directory
epcdata<-read.csv("household_power_consumption.txt",sep=";",
                  colClasses=c("character","character","character","character","character",
                               "character","character","character","character")
)

epcdata0207<-epcdata[dmy(epcdata$Date) >= dmy("01/02/2007") & dmy(epcdata$Date) < dmy("03/02/2007"),]
rm(epcdata)

epcdata0207$Global_active_power<-as.numeric(epcdata0207$Global_active_power)
epcdata0207$DateTime<-dmy_hms(paste(epcdata0207$Date,epcdata0207$Time,sep=' '))
epcdata0207$Date<-dmy(epcdata0207$Date)

png("plot2.png",width = 480, height = 480, units = "px")

plot(epcdata0207$Global_active_power~epcdata0207$DateTime,type='l',
     xlab="",ylab ="Global Active Power (kilowatts)")

dev.off()

