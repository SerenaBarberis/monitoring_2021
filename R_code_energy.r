##  R_code_energy.r  ##

install.packages('rasterdiv')
library(rasterdiv)

library(raster)

data(copNDVI)

plot(copNDVI)

copNDVI <- reclassify (copNDVI, cbind(253:255, NA)) #cleaned the blue and brown part

plot (copNDVI)

install.packages ('rasterVis')

library (rasterVis)

levelplot (copNDVI) #the graph show the highest and lowest energy in the world

#change colour
clymin <- colorRampPalette (c('yellow', 'red', 'blue'))(100)
plot (copNDVI, col=clymin)

clymed <- colorRampPalette (c('red', 'yellow', 'blue'))(100)
plot (copNDVI, col=clymed)

clymax <- colorRampPalette (c('blue', 'red', 'yellow'))(100)
plot (copNDVI, col=clymax)  #our eyes catching the yellow and catch the high biomass

#multiframe

par(mfrow=c(1,2))
clymed <- colorRampPalette (c('red', 'yellow', 'blue'))(100)
plot (copNDVI, col=clymed)
clymax <- colorRampPalette (c('blue', 'red', 'yellow'))(100)
plot (copNDVI, col=clymax)

dev.off

### make a zoom in a specific part of the planet ###
#decide the extension with xmin xmax ymin ymax

italy_ext <- c(0,20,35,55) #longitude (x) 0,20 and latitude(y) 33,55

#assign the crop to a new name
copNDVI_Italy <- crop(copNDVI, italy_ext)

plot (copNDVI_Italy, col=clymax)


##### Deforestation example

#setwd()

library(raster)
library (RStoolbox)

defor1 <- brick ('defor1.jpg')  #brick imported a satellite image (function raster only a layer). min e max values are the bit

# band1: NIR, defor1.1
# band2: red, defor1.2
# band3: green

plotRGB (defor1, r=1, g=2, b=3, stretch='lin') #if i inverted the number changes the colour of image in fluo green or blue, ecc

#exercise: import the defor2.jpg

defor2 <- brick ('defor2.jpg')

plotRGB (defor2, r=1, g=2, b=3, stretch='lin')

# Exercise: put images one beside the other with par()

par(mfrow=c(2,1))
plotRGB (defor1, r=1, g=2, b=3, stretch='lin')
plotRGB (defor2, r=1, g=2, b=3, stretch='lin')


# how to calculate the vegetation index
#defor1 is composed by nir (defor1_.1), red (defor1_.2) and green (defor1_.3), for each pixel is calculated the difference between nir and red (dvi)

# dvi for the first period
dvi1 <- defor1$defor1.1 - defor1$defor1.2
plot(dvi1)
# change color
cl <- colorRampPalette (c('darkblue', 'yellow', 'red', 'black' ))(100)
plot (dvi1, col=cl)

#dvi after the cut
dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot (dvi2, col=cl)

#par
par(mfrow=c(2,1))
plot (dvi1, col=cl, main='DVI before cut')
plot (dvi2, col=cl, main='DVI after cut')

# difference between dvi1 and dvi2 (decrease of biomass and capacity to photosynthesis (difference biomass before cut and after cut)








