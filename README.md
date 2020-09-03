<a href="https://github.com/myrba2win/exploratory-data-analysis-course-project-2">Link to Github Repo</a>
  
  ## Introduction
  
  Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the <a href="http://www.epa.gov/ttn/chief/eiinformation.html">EPA National Emissions Inventory web site.</a>

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

## Data handling

<a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip">Data for  Assessment </a>[29Mb]
<br>
  The zip file contains two files:
  PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 

<ul>
  <li><b>fips:</b> A five-digit number (represented as a string) indicating the U.S. county</li>
  <li><b>SCC:</b> The name of the source as indicated by a digit string (see source code classification table)</li>
  <li><b>Pollutant:</b> A string indicating the pollutant</li>
  <li><b>Emissions:</b> Amount of PM2.5 emitted, in tons</li>
  <li><b>type:</b> The type of source (point, non-point, on-road, or non-road)</li>
  <li><b>year:</b> The year of emissions recorded</li>
  </ul>
  
  Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.


# Questions, Analysis and Plots!
## Plot 1 
<b>Question:</b> Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


<b>Analysis:</b> According to the graph, a good behavior of PM2.5 emissions is seen, since they have been decreasing systematically. The biggest drop is observed in 2008. 


![plot1](plot1.png) 


## Plot 2 
<b>Question:</b> Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

<b>Analysis:</b> When observing the behavior of PM2.5 emissions in the city of Baltimore in the entire period analyzed, a decrease in the trend is observed, but in 2005 there was a peak that could be due to weather conditions or sensor failures that could have generate a misinterpretation of the readings.

![plot2](plot2.png) 


## Plot 3 
<b>Question:</b> Of the four types of sources indicated by the <b>type</b> (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

<b>Analysis:</b> When observing in the graph the behavior of PM2.5 emissions for the four cases analyzed, it can be affirmed that there is a decrease in the following sources; "NON-ROAD", "NONPOINT" and "ON-ROAD". The only case that generates uncertainty is that of the "POINT" source, which has grown in emission levels between 1999-2005. The year 2008 shows a significant decrease. We would have to analyze more recent data to provide a better analysis regarding this source. 

![plot3](plot3.png) 


## Plot 4 
<b>Question:</b> Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
  
  <b>Analysis:</b> Emission levels between the years 1999-2005 remained very stable with little variation in the decrease of PM2.5. On the other hand, in 2008 there was a very significant decrease in emissions.

![plot4](plot4.png) 


## Plot 5 
<b>Question:</b> How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
  
  <b>Analysis:</b> Between the years 2002-2005 a very strong level of decrease in emissions was observed with respect to the emissions of 1999. The level of improvement in emissions is practically 1/3 with respect to 1999. The year 2008 confirms with another decrease significant, which suggests that well-applied and managed control can improve the whole picture.

![plot5](plot5.png) 


## Plot 6 
<b>Question:</b> Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?
  
  <b>Analysis:</b> Clearly the emissions behaviors between both cities (Baltimore City and Los Angeles County) are comparable. In the case of Baltimore, if there is a strong decrease from 2002 onwards with respect to the measurements of 1999. The decrease is sustained over time.
With respect to Los Angeles, emission levels have been growing. Only the year 2008 is a decrease. It would be necessary to see behaviors of more recent years to understand the current scenario.

![plot6](plot6.png) 