# R code for the exam 

#nc data: we need library ncdf4
# https://cran.r-project.org/web/packages/ncdf4/index.html

install.packages('ncdf4')

library(ncdf4)
library(raster)
#setwd()

#import the images

tjan <- raster('c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc')

plot(tjan)

#Exercise: change colorramppalette

cltjan <- colorRampPalette (c('blue', 'green', 'red'))(100)

plot (tjan, col=cltjan)

toct <- raster('c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc')

plot(toct)

cltjan <- colorRampPalette (c('blue', 'green', 'red'))(100)

plot (toct, col=cltjan)

#difference between the two temperature

dift <- tjan - toct

cldif <- colorRampPalette (c('blue', 'white', 'red'))(100) 

plot (dift, col= cldif)



