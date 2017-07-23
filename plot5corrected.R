library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#5. How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?
#
scc_vehicle <- subset(SCC,grepl("[Hh]ighway" , SCC.Level.Two))
nei_vehicle_baltimore<-subset(NEI, NEI$SCC %in% scc_vehicle$SCC & fips == "24510")

year_vehicle_baltimore<-aggregate(Emissions~year,nei_vehicle_baltimore,sum)

png(file="plot5corrected.png")
qplot(year,Emissions,data = year_vehicle_baltimore,
      ylab = "Emissions from motor vehicle sources (Baltimore City)")
dev.off()