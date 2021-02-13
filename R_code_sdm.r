## R code sdm -> space distribution model: make a model based on data takes on the field and then make a map

library(sdm)
library(raster)
library(rgdal)

#system.file ->catch file in a certain library
#import the species data
file <- system.file('external/species.shp',package='sdm')
species <- shapefile(file) #or readOGR function
species

plot(species,pch=17)

species$Occurrence #show the present and absence

#different color for present and absence in the plot
plot(species[species$Occurrence == 1,], col='blue', pch=16) #==->sql code #select only the occurrence with 1 not 0
points(species[species$Occurrence == 0,], col='red', pch=16) # value 0

# predictors: look at the path
path <- system.file('external', package='sdm')

#list the predictor
lst <- list.files (path=path, pattern='asc$', full.names = T) # pattern=asc -> see the file with asc extension #make a list of data with asc extension
lst #4 predictors: elevation, precipitation , temperature and vegetation

#stack
preds <- stack(lst) #put togheter the asc file predictors

# plot preds
cl <- colorRampPalette(c('blue', 'orange', 'red', 'yellow'))(100)
plot(preds, col=cl)

#plot predictors and occurrence
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], col='black', pch=17)

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], col='black', pch=17)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], col='black', pch=17)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], col='black', pch=17)

#make the model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds) #sdm data function create the object put in the model (the manner to see the data)
datasdm

#model: put the occurrence in relation of predictors
m1<- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods= 'glm') #

#make the raster output layer
p1 <- predict(m1, newdata=preds) #predict function -> make the final prediction

#plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)  #red and yellow represent the high probability to find the species there

#add to the stack: put all togheter the prediction
s1 <-stack(preds, p1)
plot (s1, col=cl) #the 5° image is the probability to find the species




