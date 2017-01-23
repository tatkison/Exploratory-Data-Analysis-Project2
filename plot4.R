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

#  Question 4: Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?

# Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Make plot

# Import ggplot2

library(ggplot2)

png(filename='./Exploratory-Data-Analysis-Project2/plot4.png')

pngplot <- ggplot(merge.sum,aes(factor(Year),Emissions/10^5)) +
      geom_bar(stat="identity",width=0.75) +
      theme_grey() +  guides(fill=FALSE) +
      labs(x="Year", y=expression("Total PM"[2.5]*" Emission (100,000 tons)")) + 
      labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions US from 1999-2008"))

print(pngplot)

dev.off()