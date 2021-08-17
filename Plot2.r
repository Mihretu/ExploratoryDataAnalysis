library(pryr) # a package to calculate an object size in bytes
object_size(EPC) # amount of memory required 
#150,011,776 B
EPC$Datetime<-strptime(paste(EPC$Date,EPC$Time),format="%d/%m/%Y %H:%M:%S",tz="")
EPC_2007_02_01_and_2007_02_02<-subset(EPC,Datetime>="2007-02-01 00:00:00" & Datetime<"2007-02-03 00:00:00")    # subset dates to between Feb 1 and Feb 2 2007
object_size(EPC_2007_02_01_and_2007_02_02)
#580,360 B requires much less memory.
rm(EPC)

setwd("C:/Users/antoe76/Documents/GitHub/datasciencecoursera/ExploratoryDataAnalysis/Week1/")

# Plot2.png
png(filename = "Plot2.png", width=480,height=480)
plot(EPC_2007_02_01_and_2007_02_02$Datetime,EPC_2007_02_01_and_2007_02_02$Global_active_power,type="l",xlab="",ylab="Global Active Power(Kilowatts)")
dev.off()