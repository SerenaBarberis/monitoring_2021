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
