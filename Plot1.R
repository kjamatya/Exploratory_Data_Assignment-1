#get the data from file 
power<-read.csv(file='../household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#Convert date in d/m/y format
power$Date<-as.Date(power$Date, format="%d/%m/%Y")

# get data for date 2007-02-01 and 2007-02-02
power<-subset(power,subset = (power$Date =='2007-02-01' | power$Date =='2007-02-02'))
#generate graph in png
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power ,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
