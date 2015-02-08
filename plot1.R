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

#write on png
png("plot1.png",width=480,height=480,units="px")

#plot
hist(quiz_subset$Global_active_power,breaks=11,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off() #close

