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

