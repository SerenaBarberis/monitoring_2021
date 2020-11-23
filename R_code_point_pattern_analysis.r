# Poin pattern analiysis

install.packages('spatstat')
library(spatstat)

######### IMPORT DATA FROM AN EXTERNAL SOURCE

# setwd("path/lab")

# setwd for Windows
# setwd("C:/lab/")

covid <- read.table("covid_agg.csv", header=TRUE)
covid

# Now let's see the density of the covid data (how mush dense are the point)
# let's make a planar point pattern in spatstat
attach(covid)
# for ppp function: x,y and ranges (max and min) of lon and lat
covid_planar <-ppp(lon, lat, c(-180,180), c(-90,90))

density_map <- density(covid_planar)

plot(density_map)  #show the graph of the density of the data

points (covid_planar) #show the point on the density map

#change the range colour of density map
cl <- colorRampPalette(c('yellow','orange','red'))(100) # 100->amount of different colour inside the palette
plot(density_map, col=cl)
points (covid_planar)

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)
plot(density_map, col=cl)
points (covid_planar)

# Putting the countries on top of the map
install.packages('rgdal')


