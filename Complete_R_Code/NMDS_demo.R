Trt<-c(rep("A",100),rep("B",100),rep("C",100))
V1<-c(rnorm(100,50,10),rlnorm(100,100,10),runif(100,0,200))
V2<-c(rnorm(100,50,10),rlnorm(100,100,10),runif(100,0,200))
V3<-c(rnorm(100,50,10),rlnorm(100,100,10),runif(100,0,200))

data<-data.frame(Trt,V1,V2,V3)
library(vegan)
library(ggplot2)
str(data)
data.trans<-decostand(data[,-1],"total")
data.mds<-metaMDS(data.trans, k=3, autotransform=FALSE)

colors<-c("red","green","blue")

ggplot.NMDS(data.mds, data$Trt, colors)
adonis(data.trans~data$Trt)