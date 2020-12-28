# R_code_multivar.r

install.packages("vegan")
library(vegan)

#(setwd)

load('biomes_multivar.RData')
ls() #list of the file in the workspace

# Plot per species matrix
head(biomes)

# how the species are link to each other -> DEtrended CORrespondence ANAlysis: decorana

multivar<-decorana(biomes)
multivar

plot (multivar) #do not close the graph

ls()

head (biomes_types)

# biomes names in the graph:

attach(biomes_types)

ordiellipse (multivar, type, col=c('black', 'red', 'green', 'blue'), kind = 'ehull', lwd=3) # put the ellipse in the ordination. kind-> the shape we want to use. this function put in the graph an ellipse that links the data to the biome

# put the names on the ellipse-> function ordispider->link the species to the biome. label=T-> show the names

ordispider(multivar, type, col=c ('black', 'red', 'green', 'blue'), label=T)

#export the image of the graph

pdf('multivar.pdf')
plot (multivar)
ordiellipse (multivar, type, col=c('black', 'red', 'green', 'blue'), kind = 'ehull', lwd=3) 
ordispider(multivar, type, col=c ('black', 'red', 'green', 'blue'), label=T)
dev.off()
