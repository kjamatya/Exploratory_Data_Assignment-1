#get the data from file 
power<-read.csv(file='../household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#Convert date in d/m/y format
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
# get data for date 2007-02-01 and 2007-02-02
power<-subset(powerdata,subset = (power$Date =='2007-02-01' | power$Date =='2007-02-02'))
power$datetime<-paste(power$Date,powerdata$Time)
power$datetime<- as.POSIXct(power$datetime)
#generate graph in png
png("plot2.png", width = 480, height = 480)
plot(power$Global_active_power~power$datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
