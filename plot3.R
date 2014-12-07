#read in data and add column names, only read in data for 2007-02-01 and 2007-02-02 as computer has limited memory
#create DateTime column fpr plotting
qdata<-read.table("house.txt", na.strings="?",header=T,skip=66636,nrows=2880,sep=";")
names(qdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
qdata$DateTime <- strptime(paste(qdata$Date, qdata$Time), format="%d/%m/%Y %H:%M:%S")

#create plot3.png
with(qdata, plot(DateTime,Sub_metering_1, type="l",ylab="Energy Sub metering", xlab=""))
with(qdata, lines(DateTime,Sub_metering_2, col="red"))
with(qdata, lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=2.5)
dev.copy(png, file ="plot3.png",width=480,height=480)
dev.off()
