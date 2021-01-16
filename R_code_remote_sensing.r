# R code for remote sensing data analysis to monitor ecosystem changes in space and time

install.packages(c('raster', 'RStoolbox'))
###################################################################################################
#08/01/2021

library(raster)
library(RStoolbox)

#setwd()

brick ('p224r63_2011_masked.grd') #1499 and 2967 are the line and column, 4447533 are the pixel,7=layers/bands of colour

p224r63_2011 <-  brick ('p224r63_2011_masked.grd')

p224r63_2011 

plot(p224r63_2011) #the colour is default

#put a different color in the plot

cl <- colorRampPalette (c('black', 'grey', 'light grey')) (100)

plot (p224r63_2011, col=cl)

#######
#How to connect many images
par (mfrow=c(2,2))

clb <- colorRampPalette (c('dark blue', 'blue', 'light blue')) (100)

plot (p224r63_2011$B1_sre, col=clb)  #give the colour rampalette blu to the band b1_sre

# for b2_sre -> green

clg <- colorRampPalette (c('dark green', 'green', 'light green')) (100)

plot (p224r63_2011$B2_sre, col=clg)  

#for b3_sre ->red

clr <- colorRampPalette (c('dark red', 'red', 'pink')) (100)

plot (p224r63_2011$B3_sre, col=clr) 

#plot the final band b4_sre

clnir <- colorRampPalette (c('red', 'orange', 'yellow')) (100)

plot (p224r63_2011$B4_sre, col=nir) 

#bands to rgb (human eyes). using only 3 bands for time

plotRGB (p224r63_2011, r=3, g=2, b=1, stretch='lin') 

plotRGB (p224r63_2011, r=4, g=3, b=2, stretch='lin') #remove blue, put nir

plotRGB (p224r63_2011, r=3, g=4, b=2, stretch='lin') #4 in the green

plotRGB (p224r63_2011, r=3, g=2, b=4, stretch='lin') #4 in the blue

#

par (mfrow=c(2,2))
plotRGB (p224r63_2011, r=3, g=2, b=1, stretch='lin') 
plotRGB (p224r63_2011, r=4, g=3, b=2, stretch='lin') 
plotRGB (p224r63_2011, r=3, g=4, b=2, stretch='lin') 
plotRGB (p224r63_2011, r=3, g=2, b=4, stretch='lin')










