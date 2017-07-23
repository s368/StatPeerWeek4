library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#6. Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
#
scc_vehicle <- subset(SCC,grepl(glob2rx("*Vehicle*") , EI.Sector))
nei_vehicle_ba_la<-subset(NEI, NEI$SCC %in% scc_vehicle$SCC & 
                                (fips == "24510" | fips == "06037"))

year_vehicle_ba_la<-aggregate(Emissions~year+fips,nei_vehicle_ba_la,sum)

png(file="plot6.png")
qplot(year,Emissions,data = year_vehicle_ba_la, color = fips,
      ylab = "Emissions from motor vehicle sources (Baltomore City[24510] vs Los Angeles County[06037])")
dev.off()