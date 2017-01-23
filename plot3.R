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

# Question 3: Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four 
# sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

# Import ggplot2

library(ggplot2)

# Get the subset of data for Baltimore City

bCity_NEI <- NEI[NEI$fips=="24510",]

# Aggregate the totals by year from above subset

aggregatedTotByYear <- aggregate(Emissions ~ year +  type, bCity_NEI, sum)

# Make plot

png(filename='./Exploratory-Data-Analysis-Project2/plot3.png')

pngplot <- ggplot(aggregatedTotByYear,aes(factor(year),Emissions,fill=type)) +
      geom_bar(stat="identity") +
      scale_fill_manual(values=c("red","blue","green","orange")) +
      theme_grey() + guides(fill=FALSE) +
      facet_grid(.~type,scales = "free",space="free") + 
      labs(x="Year", y=expression("Total PM"[2.5]*" Emission (in Tons)")) + 
      labs(title=expression("Total PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Type"))

print(pngplot)

dev.off()