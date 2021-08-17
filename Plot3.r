library(pryr) # a package to calculate an object size in bytes
object_size(EPC) # amount of memory required 
#150,011,776 B
EPC$Datetime<-strptime(paste(EPC$Date,EPC$Time),format="%d/%m/%Y %H:%M:%S",tz="")
EPC_2007_02_01_and_2007_02_02<-subset(EPC,Datetime>="2007-02-01 00:00:00" & Datetime<"2007-02-03 00:00:00")    # subset dates to between Feb 1 and Feb 2 2007
object_size(EPC_2007_02_01_and_2007_02_02)
#580,360 B requires much less memory.
rm(EPC)

setwd("C:/Users/antoe76/Documents/GitHub/datasciencecoursera/ExploratoryDataAnalysis/Week1/")


#plot 3
png(filename = "Plot3.png", width=480,height=480)
with(subset(EPC_2007_02_01_and_2007_02_02,Sub_metering_1!="?" & Sub_metering_2 !="?" & Sub_metering_3 !="?"),{plot(Datetime,Sub_metering_1,type="l",ylab="Energy sub metering",col="black",xlab="")
         lines(Datetime,Sub_metering_2,type = "l", col = "red")
         lines(Datetime,Sub_metering_3,type = "l", col = "blue")})
		 legend("topright",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col  = c("black","blue","red"),       # Color of the squares
        lty = 1,lwd=2) # Color of the border of the squares
		
dev.off()