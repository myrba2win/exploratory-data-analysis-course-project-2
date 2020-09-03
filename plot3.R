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
head(NEI)

# Verify if "Source_Classification_Code.rds" file was downloaded before. If not, just do it.
if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}
dim(SCC)
head(SCC)


##  Have total emissions from PM2.5 decreased in the Baltimore City, 
##  Maryland (fips == "24510") 
##  from 1999 to 2008? Use the base plotting system to make a plot answering this question.


library(ggplot2)

##  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
##  variable, which of these four sources have seen decreases in emissions from 1999–2008 
##  for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 
##  plotting system to make a plot answer this question.
##  Continuing with Baltimore Code 24510

subset_NEI  <- NEI[NEI$fips=="24510", ]

total_emissions_PM25_type <- aggregate(Emissions ~ year + type, subset_NEI, sum)

png("plot3.png", width=640, height=480)

data_plot <- ggplot(data = total_emissions_PM25_type, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
  geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Total Baltimore Emissions by Source Type")
print(data_plot)

dev.off()

