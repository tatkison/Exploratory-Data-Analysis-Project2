## Coursera Exploratory Data Analysis
## Project 2
## January 22, 2017

###Terry M. Atkison

This is my Repo for the submission of the course project for the Johns Hopkins Exploratory Data Analysis course.

### Overview

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

For each plot you should

* Construct the plot and save it to a PNG file.
* Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
* Upload the PNG file on the Assignment submission page
* Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.

### Notes on running the scripts

Each plot(x).R script has a first section to download and unzip the source data files (Summary_SCC_PM25.rds and Source_Classification_Code.rds) into the proper data folder for analysis.  Once the first plottings script has been run, the subsequent ones will simply ignore this step.

Each plot(x).R script will read the source files into the variables 'NEI' and 'SCC', and then utilize these data sources for plotting purposes.

There are a total of six plot(x).R scripts and six PNG files, each named to match their generating plot(x).R script.  

### plot1.R

Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

This plot is labeled on the Y axis in millions of tons for clarity.

### plot2.R

Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

This plot is labeled on the Y axis in thousands of tons for clarity.

### plot3.R

Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

This plot is labeled in Tons on the Y axis.  I decided to use side-by-side bar charts for clarity.  I got info on building pretty ggplot2 bar charts from:
https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

### plot4.R

Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

This plot is labeled in 100,000 ton increments on the Y axis.  

### plot5.R

How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

This plot is labeled in 100,000 ton increments on the Y axis.

### plot6.R

Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

This plot is labeled in 1000 ton increments