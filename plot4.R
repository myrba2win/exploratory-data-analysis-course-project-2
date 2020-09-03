# Read the base zip file "exdata_data_NEI_data.zip" that contains the data
## This first line will likely take a few seconds. Be patient!

dataInput_file <- "exdata_data_NEI_data.zip"
if (!file.exists(dataInput_file)) {
  data_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(data_URL, destfile = dataInput_file)
  unzip (zipfile = dataInput_file)
}



# Verify if "summarySCC_PM25.rds" file was downloaded before. If not, just do it.
if (!exists("NEI")) {
  NEI <- readRDS("summarySCC_PM25.rds")
}
dim(NEI)

# Verify if "Source_Classification_Code.rds" file was downloaded before. If not, just do it.
if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}
dim(SCC)




library(ggplot2)

## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?



png("plot4.png", width=640, height=480)


combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

# Find emissions from coal combustion-related sources
emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
require(dplyr)
emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
require(ggplot2)
c_plot <- ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  # facet_grid(. ~ year) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")


print(c_plot)

dev.off()
