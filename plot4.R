library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#4. Across the United States, 
#how have emissions from coal combustion-related sources changed from 1999???2008?
#
scc_comb_coal <- subset(SCC,grepl(glob2rx("*Comb*Coal*") , EI.Sector))
nei_comb_coal<-subset(NEI, NEI$SCC %in% scc_comb_coal$SCC)

year_comb_coal<-aggregate(Emissions~year,nei_comb_coal,sum)

png(file="plot4.png")
qplot(year,Emissions,data = year_comb_coal,
      ylab = "Emissions from coal combustion-related sources (USA)")
dev.off()