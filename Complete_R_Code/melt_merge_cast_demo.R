###just making a fake dataset to demonstrate this
Sample<-c(1,2,3,4,5)
Crop<-c("SW","SW","CC","CC","CC")
OTU1<-runif(5)
OTU2<-runif(5)
OTU3<-runif(5)
dataset<-data.frame(Sample,Crop,OTU1,OTU2,OTU3)


OTU_id<-c("OTU1","OTU2","OTU3")
Phyla<-c("Acido","Actino","Verruco")
phylogeny<-data.frame(OTU_id,Phyla)
########

library(plyr)
library(reshape)
#I want to "melt" my dataset so that I have a new column called variable that contains all the OTU ids.  The id=c() portion of the function tells R what columns you would like to hold constant

dataset.melt<-melt(dataset, id=c("Sample","Crop"))
#check out dataset.melt to see what it looks like, I find it hard to visualize in my head
dataset.melt

#use merge to bring phylogeny and melted dataset together;
dataset.melt.merged<-merge(dataset.melt, phylogeny, by.x="variable",by.y="OTU_id")
#check it out, sometimes columns get reorganized in a weird way which you can easily switch around
dataset.melt.merged

#if you want to make a new dataframe you can use cast

dataset.phyla.level<-data.frame(cast(dataset.melt.merged, Sample+Crop~Phyla, value="value", fun.aggregate=sum, add.missing=TRUE))
dataset.phyla.level