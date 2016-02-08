setwd("~/data/plots")
library(dplyr)
library(datasets)

powerdata <- read.table("household_power_consumption.txt", sep =";")
powerdata$date <- strptime(as.character(powerdata$V1), format = "%d/%m/%Y")
febdata <- subset(powerdata, powerdata$date == "2007-02-01" | powerdata$date == "2007-02-02")

#mutate(febdata, weekday = wday(Date))
febdata$V3 <- as.numeric(febdata$V3)
febdata <- mutate(febdata, kilowatt = V3/500)
hist(febdata$kilowatt, col ="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file ="plot1.png")
dev.off()
