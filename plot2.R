df <- read.table("householdPower.txt",sep=";",header = TRUE, stringsAsFactors=FALSE)
df_mnth <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#check data type
#str(df_mnth) 

#convert Global_active_power from charecter to numeric and store in a variable
globalActivePower <- as.numeric(df_mnth$Global_active_power)

#combine date and time
datetime <- paste(df_mnth$Date, df_mnth$Time, sep=" ")

#class(datetime)
#convert to POSIXlt and POSIXct class

wkdys <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#class(wkdys)

#open "device that will hold the results of histogram function
png("plot2.png", width=480, height=480)
plot(wkdys, globalActivePower, type="l", xlab='',ylab="Global Active Power (kilowatts)")
dev.off()