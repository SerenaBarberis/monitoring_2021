# R code for plotting the relationship among ecological variables

install.packages('sp')
library(sp)

#data is use to recall dataset
data(meuse)
meuse
# View->show the data in a different window
View(meuse)

head(meuse)

#Exercise: mean of all of the variables?
summary(meuse)

#Exercise: plot zinc  (y) against cadmuim (x)
#$->use to link different elements of the data
plot(meuse$cadmium,meuse$zinc)

attach(meuse)
plot(cadmium,zinc)

plot(cadmium,lead)

#scatterplot matrices
pairs (meuse)

#Question: peiring only the elements part of the dataset: how to do that?
#only with cadmium,copper,lead,zinc...

###Lecture n.2 on ecological variables###

#exercise
#Recall the package sp, recall the dataset meuse

library(sp)
data(meuse)

pairs(meuse)

head(meuse)

#cadmium copper lead zinc
#pairs with soil variables
#from colomn 3 to colomn 6

pairs(meuse[,3:6])

#let's use the names of the columns
pairs(~cadmium+copper+lead+zinc, data=meuse)

#let's prettify the graph
#Exercise: just use cadmium, lead and zinc
pairs(~cadmium+lead+zinc, data=meuse)

#Exercise: change the color
pairs(~cadmium+copper+lead+zinc, data=meuse, col='red')

#Exercise: change the symbol to filled triangles: pch
pairs(~cadmium+copper+lead+zinc, data=meuse, col='red',pch=17)

#exercise: increase the size of the triangles
pairs(~cadmium+copper+lead+zinc, data=meuse, col='red',pch=17,cex=3)

