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
