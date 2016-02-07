df <- read.table("householdPower.txt",sep=";",header = TRUE, stringsAsFactors=FALSE)
df_mnth <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#check data type
#str(df_mnth) 

#convert from charecter to numeric and store in a variable
globalActivePower <- as.numeric(df_mnth$Global_active_power)
submeter1 <- as.numeric(df_mnth$Sub_metering_1)
submeter2 <- as.numeric(df_mnth$Sub_metering_2)
submeter3 <- as.numeric(df_mnth$Sub_metering_3)

#combine date and time
datetime <- paste(df_mnth$Date, df_mnth$Time, sep=" ")

#class(datetime)
#convert to POSIXlt and POSIXct class

wkdys <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#class(wkdys)

#open "device that will hold the results of histogram function
png("plot3.png", width=480, height=480)
plot(wkdys, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(wkdys, submeter2, type="l", col='red')
lines(wkdys, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()