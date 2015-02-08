data=read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")#read data into character#
data$Date<-as.Date(data$Date,format="%d/%m/%Y")#make the date into date formate#
subset=data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),1:9]#create subset of 2007-02-01 and 2007-02-02#
datetime=as.POSIXct(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")#combind date and time into one datetime#
subset=cbind(subset,datetime)#insert the new datetime col into the subset#
subset$Global_active_power<-as.numeric(subset$Global_active_power)

#Plot#
par(mfrow=c(2,2))
with(subset,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global active power(kilowatts)"))
with(subset,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(subset,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(subset$datetime,subset$Sub_metering_2,col="red")
lines(subset$datetime,subset$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_merging_1","Sub_merging_2","Sub_merging_3"))
with(subset,plot(datetime,Global_reactive_power,type="l"))

