#read in data and add column names, only read in data for 2007-02-01 and 2007-02-02 as computer has limited memory
#create DateTime column for plotting
qdata<-read.table("house.txt", na.strings="?",header=T,skip=66636,nrows=2880,sep=";")
names(qdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
qdata$DateTime <- strptime(paste(qdata$Date, qdata$Time), format="%d/%m/%Y %H:%M:%S")

#create plot2.png
with(qdata, plot(DateTime,Global_active_power, type="l",ylab="Global Active Power (killowats)", xlab=""))
dev.copy(png, file ="plot2.png",width=480,height=480)
dev.off()
