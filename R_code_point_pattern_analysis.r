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

plot(density_map)  #show in the graph the density of the data

points (covid_planar) #show the point on the density map

#change the range colour of density map
cl <- colorRampPalette(c('yellow','orange','red'))(100) # 100->amount of different colour inside the palette
plot(density_map, col=cl)
points (covid_planar)

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) #100->number of colours of the range palette
plot(density_map, col=cl)
points (covid_planar)

# Putting the countries on top of the map
install.packages('rgdal')

library(rgdal)

coastlines <- readOGR('ne_10m_coastline.shp') 

##Replot the density map

#cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)
plot(density_map, col=cl)
points (covid_planar)
plot(coastlines, add=TRUE) #true/folds-> plot the image on the top of the previews map and not in a different window

#change the point type--->phc=19
plot(density_map, col=cl)
points (covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)

#Save the map as an png
png ('figure1.png')
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)
plot(density_map, col=cl)
points (covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)
dev.off()

#save as pdf
pdf('figur.pdf')
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)
plot(density_map, col=cl)
points (covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)
dev.off()


#Interpolate case data

marks(covid_planar) <- cases  #link the cases to the marks
cases_map <- Smooth(covid_planar)

plot(cases_map, col=cl)
points(covid_planar)
plot(coastlines, add=T)  #the density is oriented to china because there are the high number of cases


##### Plotting points with different size related to covid data together with the interpolated map

library(spatstat)

library (rgdal)

covid <- read.table('covid_agg.csv', header=TRUE) # or read.csv

head(covid)

attach(covid)  #if you don't attach: covid$lon
covid_planar <-ppp(lon, lat, c(-180,180), c(-90,90))

marks(covid_planar) <- cases 
cases_map <- Smooth(covid_planar)

cl <- colorRampPalette(c('lightpink2', 'lightsalmon', 'tomato1', 'red3', 'maroon'))(100)

### name of colour in R-> https://www.datanovia.com/en/blog/r-colors-amazong-resources-you-want-to-know/

plot(cases_map, col=cl)

###
install.packages('sf')
library(sf)

Spoints <- st_as_sf(covid, coords = c('lon', 'lat'))  

plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd =3, add=T)  #lwd=line of the different points   #the points are out of map because represent the dimension of value

plot(cases_map, col=cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd =3, add=T)  #/10000 to reduce the dimension of the points

# put the coastline on the map

library(rgdal)
#put a smoother to the coastlines by resampling
coastlines <- readOGR('ne_10m_coastline.shp')
plot(coastlines, add=T)


##### Leonardo Zabotti data
 
#setwd()

leo <- read.table('dati_zabotti.csv', head=T, sep=',') #head=header

head(leo)

attach(leo)

library(spatstat)

summary(leo)

leo_ppp <- ppp (x,y,c(2300000, 2325000), c(5005000, 5045000)) # range of x and range of y (min and max)

plot(leo_ppp)

density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)
 #save workspace
q()
