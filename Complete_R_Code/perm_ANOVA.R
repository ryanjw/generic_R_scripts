

perm.ANOVA<-function(Y,X){
F.obs<-anova(lm(Y~X,data=NULL))$F[[1]]  #Find Test value and save
permute<-9999
P.Ftest<-1
F.rand.vec<-NULL
F.rand.vec<-rbind(F.rand.vec,F.obs)
for(i in 1:permute){
  ###Shuffle Data
	y.rand<-sample(Y)  #SHUFFLE FIRST COL
	F.rand<-anova(lm(y.rand~X))$F[[1]]  
	F.rand.vec<-rbind(F.rand.vec,F.rand)
	P.Ftest<-if(F.rand>=F.obs) (P.Ftest+1) else P.Ftest
	}  
return(c(F.obs,P.Ftest/(permute+1)))
hist(F.rand.vec,40,freq=T,col="gray")
segments(F.obs, 0, F.obs, 5000,col="red")  ##Plot Observed value
}



