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

subset_NEI  <- NEI[NEI$fips=="24510", ]

total_emissions_PM25 <- aggregate(Emissions ~ year, subset_NEI, sum)

png('plot2.png')

barplot(height=total_emissions_PM25$Emissions, 
        names.arg=total_emissions_PM25$year, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

dev.off()
