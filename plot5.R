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

# Question 5: How have emissions from motor vehicle sources changed 
# from 1999-2008 in Baltimore City?

# Get the subset of data for Baltimore City

bCity_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

# Aggregate the totals by year from above subset

aggregatedTotByYear <- aggregate(Emissions ~ year, bCity_NEI, sum)

#  Make plot

library(ggplot2)

png(filename='./Exploratory-Data-Analysis-Project2/plot5.png')

pngplot <- ggplot(bCity_NEI,aes(factor(year),Emissions)) +
      geom_bar(stat="identity",width=0.75) +
      theme_bw() +  guides(fill=FALSE) +
      labs(x="year", y=expression("Total PM"[2.5]*" Emission (100,000 Tons)")) + 
      labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions Baltimore 1999-2008"))

print(pngplot)

dev.off()
