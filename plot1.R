data=read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")#read data into character#
data$Date<-as.Date(data$Date,format="%d/%m/%Y")#make the date into date formate#
subset=data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),1:9]#create subset of 2007-02-01 and 2007-02-02#
datetime=as.POSIXct(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")#combind date and time into one datetime#
subset=cbind(subset,datetime)#insert the new datetime col into the subset#
subset$Global_active_power<-as.numeric(subset$Global_active_power)

#Plot#
par(mfrow=c(1,1))
with(subset,hist(Global_active_power,col="red",main="Global active power",xlab="Global active power(kilowatts)"))


