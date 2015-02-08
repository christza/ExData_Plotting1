# download file
download_file<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination_file<-"exdata-data-household_power_consumption.zip"
download.file(download_file,destination_file)

# unzip file
datafile<-unzip("exdata-data-household_power_consumption.zip")

# read part of the file
quiz_data<-read.table(datafile,header=T,na.strings="?",sep=";",nrow=2.5*30*24*60)
quiz_data$Date<-as.Date(strptime(quiz_data$Date,"%d/%m/%Y"),"%Y/%m/%d")
quiz_subset<-quiz_data[quiz_data$Date=="2007-02-01" | quiz_data$Date=="2007-02-02",]

png("plot2.png",width=480,height=480,units="px")

plot(quiz_subset$Global_active_power,xaxt="n",type="l",ylab="Global Active Power (kilowatts)",xlab="")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off() #close


