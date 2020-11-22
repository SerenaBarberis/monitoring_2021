# R spatial 

install.packages('sp')
library(sp)

data(meuse)

head(meuse)

coordinates(meuse) = ~ x+y

plot(meuse)

# sp plot is used to plot elements like zinc, lead etc.. spread in space

spplot(meuse,'lead')  # concentration of lead in space, '' to recall the column of interest 

#Exercise: plot the concentration of copper
spplot(meuse,'copper', main='concentrarion of copper')

Exercise: see copper and zinc in two different panel but in the same function
spplot(meuse,c('copper','zinc'))  #c=array function

# Rather than using colours, let's make us of bubbles
bubble(meuse,'zinc')

#do the same for lead
bubble(meuse,'lead')
bubble(meuse,'lead',col='red')

### Installing the ggplot2 library/package

install.packages('ggplot2')

library(ggplot2)

#ecological dataframe
#biofuels
biofuels<- c(120, 200, 350, 570, 750) #array of values: c
#oxydative enzimes
oxydative<- c(1200, 1300, 21000, 34000, 50000)

#dataframe
d<- data.frame(biofuels,oxydative)
d

#Ggplot function
ggplot(d, aes (x= biofuels, y= oxydative))

#geom_point function -> put the data in the graph
ggplot(d, aes (x= biofuels, y= oxydative)) + geom_point()

ggplot(d, aes (x= biofuels, y= oxydative)) + geom_point(col='red', size=5)

# lines instead points
ggplot(d, aes (x= biofuels, y= oxydative)) + geom_line()

# lines and points on the graph
ggplot(d, aes (x= biofuels, y= oxydative)) + geom_line() + geom_point(col='red', size=5)

# polygons -> show the spread of the data
ggplot(d, aes (x= biofuels, y= oxydative)) + geom_polygon()

### IMPORT DATA FROM AN EXTERNAL SOURCE ###

#setwd for windows
setwd('C:/Users/Sery/Desktop/Lab')

covid<- read.table('covid_agg.csv', header=TRUE)
covid


