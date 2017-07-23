library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999???2008 for Baltimore City? 
#Which have seen increases in emissions from 1999???2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
#
year_type<-aggregate(Emissions~year+type,subset(NEI,fips == "24510"),sum)

png(file="plot3.png")
qplot(year,Emissions,data = year_type, color = type, 
      ylab = "Emissions by the type (Baltimore City)")
dev.off()