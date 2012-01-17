pkgname <- "OneHandClapping"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('OneHandClapping')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("OneHandClapping")
### * OneHandClapping

flush(stderr()); flush(stdout())

### Name: OneHandClapping-package
### Title: Prediction of condition-specific transcription factor
###   interactions
### Aliases: OneHandClapping-package OneHandClapping
### Keywords: package

### ** Examples

#~~ simple examples of the most important functions ~~



cleanEx()
nameEx("Screening")
### * Screening

flush(stderr()); flush(stdout())

### Name: Screening-class
### Title: Class '"Screening"'
### Aliases: Screening-class getInteractions,Screening-method
###   plot,Screening-method
### Keywords: classes

### ** Examples

showClass("Screening")



cleanEx()
nameEx("Screening.validated")
### * Screening.validated

flush(stderr()); flush(stdout())

### Name: Screening.validated-class
### Title: Class '"Screening.validated"'
### Aliases: Screening.validated-class
###   getValidated,Screening.validated-method
### Keywords: classes

### ** Examples

showClass("Screening.validated")



cleanEx()
nameEx("biogridList.71")
### * biogridList.71

flush(stderr()); flush(stdout())

### Name: biogridList.71
### Title: TF interactions from BioGRID
### Aliases: biogridList.71
### Keywords: datasets

### ** Examples

data(biogridList.71)
sapply(biogridList.71, dim)
head(biogridList.71[["all"]])



cleanEx()
nameEx("colorsbreaks")
### * colorsbreaks

flush(stderr()); flush(stdout())

### Name: colorsbreaks
### Title: Generate color palette and breaks for heatmaps
### Aliases: colorsbreaks
### Keywords: color

### ** Examples

x <- matrix(runif(200, min=-3,max=1),ncol=10,nrow=20) ##shifted normal distribution
cb <- colorsbreaks(range(x),c("red","white","blue"),10,damp=0)
heatmap(x,scale="none",col=cb$col,breaks=cb$breaks) 

cb <- colorsbreaks(range(x),c("red","white","blue"),100,damp=0.9)
heatmap(x,scale="none",col=cb$col,breaks=cb$breaks) 




cleanEx()
nameEx("salt.folds")
### * salt.folds

flush(stderr()); flush(stdout())

### Name: salt.folds
### Title: mRNA folds after 30 min of 0.8M NaCl stimulation relative to
###   wildtype
### Aliases: salt.folds
### Keywords: datasets

### ** Examples

data(salt.folds)
head(salt.folds)



cleanEx()
nameEx("siscreen")
### * siscreen

flush(stderr()); flush(stdout())

### Name: siscreen
### Title: Perform OneHandClapping
### Aliases: siscreen
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(salt.folds)
data(yeastract)

#
scoring.lr <- new("siscreen.IntScore",name="LR",fun = siscreen.lr,params=list(lods=as.matrix(salt.folds),genes=names(salt.folds),pval=FALSE))
hohc <- siscreen(yeastract,scoring.lr,"cor",siscreen.paircluster)
show(hohc)
plot(hohc)

## Not run: 
##D ###full example from publication
##D #filter yeastract graph, removing TFs with less than 10 annotated genes and Tfs with homogenous strongly expressed target genes
##D tflist <- yeastract[which(sapply(yeastract,length) > 10)]
##D tflist <- tflist[-which(names(tflist) %in% c("GIS1","GAT4","HOT1","SPS18"))]
##D 
##D hohc.paper <- siscreen(tflist,scoring.lr,"cor",siscreen.paircluster,cmeth="average")
##D #validate using BioGRID database
##D data(biogridList.71)
##D hohc.validated <- siscreen.validate.biogrid(hohc.paper,biogridList.71[["all"]])
##D show(hohc.validated) # 22.03##D 
##D plot(hohc.validated) #highlights validated interactions in heatmap
## End(Not run)



cleanEx()
nameEx("siscreen.lr")
### * siscreen.lr

flush(stderr()); flush(stdout())

### Name: siscreen.lr
### Title: Interaction Score for OneHandClapping
### Aliases: siscreen.lr
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(yeastract)
data(salt.folds)
combn(names(yeastract)[1:10],2,function(p){siscreen.lr(p[1],p[2],yeastract,as.matrix(salt.folds), names(salt.folds))})
## Not run: 
##D ###return all coefficients
##D coefs = combn(names(yeastract),2,function(p){siscreen.lr(p[1],p[2],yeastract,as.matrix(salt.folds), names(salt.folds),retcoefs=T)},simplify=FALSE)
##D #and plot them 
##D library(rgl)
##D plot3d(x=sapply(coefs,function(v)v[2]),y=sapply(coefs,function(v)v[3]),z=sapply(coefs,function(v)v[4])
##D   ,xlab="Effect TF1",ylab="Effect TF2",zlab="Effect interaction")
## End(Not run)



cleanEx()
nameEx("siscreen.paircluster")
### * siscreen.paircluster

flush(stderr()); flush(stdout())

### Name: siscreen.paircluster
### Title: Prediction Funtion for OneHandClapping
### Aliases: siscreen.paircluster
### Keywords: ~kwd1 ~kwd2

### ** Examples

hc = hclust(dist(USArrests), "ave")
siscreen.paircluster(as.dendrogram(hc))



cleanEx()
nameEx("yeastract")
### * yeastract

flush(stderr()); flush(stdout())

### Name: yeastract
### Title: Yeastract database, TF-target relations
### Aliases: yeastract
### Keywords: datasets

### ** Examples

data(yeastract)
names(yeastract)
yeastract[["GCN4"]]



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
