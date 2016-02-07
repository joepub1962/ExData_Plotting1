df <- read.table("householdPower.txt",sep=";",header = TRUE, stringsAsFactors=FALSE)
df_mnth <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#check data type
str(df_mnth) 

#convert Global_active_power from charecter to numeric and store in a variable
globalActivePower <- as.numeric(df_mnth$Global_active_power)

#open "device that will hold the results of histogram function
png("plot1.png", width=480, height=480)
hist(globalActivePower, main ="Global Active Power",xlab="Global Active Power (kilowatts)", col='red')
dev.off()