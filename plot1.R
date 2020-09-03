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