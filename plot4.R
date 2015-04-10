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

png("plot4.png",width = 480, height = 480, units = "px")

#Plot Parameters
par(mfrow=c(2,2))
# Global Active Power
plot(epcdata0207$Global_active_power~epcdata0207$DateTime,type='l',
     xlab="",ylab ="Global Active Power")

#Voltage
plot(epcdata0207$Voltage~epcdata0207$DateTime,type='l',
      xlab="datetime",ylab ="Voltage",)


#Energy sub metering
plot(epcdata0207$Sub_metering_1~epcdata0207$DateTime,type='l',
           xlab="",ylab ="Energy sub metering",)
lines(epcdata0207$Sub_metering_2~epcdata0207$DateTime,col="red")
lines(epcdata0207$Sub_metering_3~epcdata0207$DateTime,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),cex=0.5,y.intersp=1,bty="n")

#Global_reactive_power
plot(epcdata0207$Global_reactive_power~epcdata0207$DateTime,type='l',
      xlab="datetime",ylab='Global_reactive_power')

dev.off()

 
