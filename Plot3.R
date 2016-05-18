#get the data from file 
power<-read.csv(file='../household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#Convert date in d/m/y format
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
# get data for date 2007-02-01 and 2007-02-02
power<-subset(power,subset = (power$Date =='2007-02-01' | power$Date =='2007-02-02'))
power$datetime<-paste(power$Date,power$Time)
power$datetime<- as.POSIXct(power$datetime)
#generate graph in png
png("plot3.png", width = 480, height = 480)
with(power,plot(datetime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(power,lines(datetime, as.numeric(Sub_metering_2), col="red"))
with(power,lines(datetime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()
