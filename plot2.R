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

# Question 2:  Have total emissions from PM2.5 decreased in the 
# Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Get the subset of data for Baltimore City

bCity_NEI <- NEI[NEI$fips=="24510",]

# Aggregate the totals by year from above subset

aggregatedTotByYear <- aggregate(Emissions ~ year, bCity_NEI, sum)

# Make plot

png(filename='./Exploratory-Data-Analysis-Project2/plot2.png')

barplot(
      height=(aggregatedTotByYear$Emissions)/10^3, 
      names.arg=aggregatedTotByYear$year, 
      xlab="years", 
      ylab=expression('total PM'[2.5]*' Emissions (1000s of tons) '),
      main=expression('Total PM'[2.5]*' in the Baltimore City, MD Emissions From All Sources'))
dev.off()

