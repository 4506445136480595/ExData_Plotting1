#read in data and add column names, only read in data for 2007-02-01 and 2007-02-02 as computer has limited memory
#create DateTime column for plotting
qdata<-read.table("house.txt", na.strings="?",header=T,skip=66636,nrows=2880,sep=";")
names(qdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
qdata$DateTime <- strptime(paste(qdata$Date, qdata$Time), format="%d/%m/%Y %H:%M:%S")

#create plot4.png
par(mfrow=c(2,2))
with(qdata, plot(DateTime,Global_active_power, type="l",ylab="Global Active Power (killowats)", xlab=""))
with(qdata, plot(DateTime,Voltage, type="l",ylab="Voltage", xlab="datetime"))
with(qdata, plot(DateTime,Sub_metering_1, type="l",ylab="Energy Sub metering", xlab=""))
with(qdata, lines(DateTime,Sub_metering_2, col="red"))
with(qdata, lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), cex=0.85, lwd=1.5, bty="n")
with(qdata, plot(DateTime,Global_reactive_power, type="l", xlab="datetime"))
dev.copy(png, file ="plot4.png",width=480,height=480)
dev.off()
