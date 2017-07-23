## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#
agg<-aggregate(Emissions~year,subset(NEI,fips == "24510"),sum)

png(file="plot2.png")
plot(agg$year,agg$Emissions,xlab = "year", ylab = "Emissions in the Baltimore City")
dev.off()