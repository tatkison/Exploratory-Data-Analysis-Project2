# Get Dataset and Make Directories if Needed

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl,destfile="./data/NEI_data.zip")

# Unzip File to Proper Location

unzip(zipfile="./data/NEI_data.zip",exdir="./data")

# Set Path

data_path <- file.path("./data")

# Read in Datafiles
# Source_Classification_Code

if(!exists("SCC"))  {
SCC <- readRDS(file.path(data_path, "Source_Classification_Code.rds"))
}

# SummarySCC_PM25

if(!exists("NEI"))  {
NEI <- readRDS(file.path(data_path, "SummarySCC_PM25.rds"))
}

# Question 1: Have total emissions from PM2.5 decreased in the 
# United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for 
# each of the years 1999, 2002, 2005, and 2008.

# Make the plot using the base plotting system

# Get aggregated totals from NEI data set

aggregatedTotByYear <- aggregate(Emissions ~ year, NEI, sum)

# Make plot

png(filename='./Exploratory-Data-Analysis-Project2/plot1.png')

barplot(
      height=(aggregatedTotByYear$Emissions)/10^6,
      names.arg=aggregatedTotByYear$year,
      xlab="Year",
      ylab=expression('total PM'[2.5]*' Emissions (millions of tons)'),
      main=expression('total PM'[2.5]*' Emissions From Each Year'),
      #main="Total PM[2.5]* Emissions From All US Sources"
)

dev.off()
