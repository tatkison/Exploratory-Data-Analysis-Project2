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

# Question 6: Compare emissions from motor vehicle sources in 
# Baltimore City with emissions from motor vehicle sources in 
# Los Angeles County, California (fips == "06037"). Which city 
#has seen greater changes over time in motor vehicle emissions?

# Get the subset of data for Baltimore City and add City name

bCity_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
bCity_NEI$city <- "Baltimore City, Maryland"

# Get the subset of data for Los Angeles and add City name

LA_NEI <- NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",]
LA_NEI$city <- "Los Angeles, California"

# Combine into one data set

both_NEI <- rbind(bCity_NEI, LA_NEI)

#  Make plot

library(ggplot2)

png(filename='./Exploratory-Data-Analysis-Project2/plot6.png')

pngplot <- ggplot(both_NEI, aes(x=factor(year), y=Emissions, fill=city)) +
      geom_bar(aes(fill=year),stat="identity") +
      facet_grid(scales="free", space="free", .~city) +
      guides(fill=FALSE) + theme_bw() +
      labs(x="Year", y=expression("Total PM"[2.5]*" Emission (100s of Tons)")) + 
      labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions, Baltimore & LA, 1999-2008"))

print(pngplot)

dev.off()