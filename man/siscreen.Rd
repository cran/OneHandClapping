\name{siscreen}
\alias{siscreen}
\title{
Perform OneHandClapping
}
\description{
This is the main method implementing OneHandClapping.
}
\usage{
siscreen(TFtarget, IntScore, dfun, efun, cmeth = "single", twoints = FALSE)
}
\arguments{
  \item{TFtarget}{
Transcription factor - target graph, see  \link{biogridList.71}
}
  \item{IntScore}{
object of class siscreen.IntScore, defining the interactions score. Currently only a score base on 
a logistic linear regression is implemented, see \link{siscreen.lr} 
}
  \item{dfun}{
distance function used in clustering. choices include "cor" (for \code{1 - p} Pearson correlation)
or any name accepted as \code{method} argument to \code{\link{dist}}. Default: "cor"
}
  \item{efun}{
Function used for prediction of interactiong pairs. Takes dendrogram as input. Currently only on such function is implemented (See \code{\link{siscreen.paircluster}})
}
  \item{cmeth}{
Method used for clustering. Anything accepted by \code{\link{hclust}} (default: "single")
}
  \item{twoints}{
Currently not implemented. Will be used to extend the method on two different types of interactions. Defaults to \code{FALSE}
}
}
\details{
This function implements OneHandClapping as described in the paper.
}
\value{
Returns an object of type \code{\linkS4class{Screening}} with methods \code{\link[=Screening-class]{getInteractions}, \link[=Screening-class]{plot}} 
and \code{\link{show}}
}
\author{
Sebastian Dümcke
}
\note{
It takes a while to run...
}

\seealso{
\code{\linkS4class{Screening}}
}
\examples{
\dontrun{
data(salt.folds)
data(yeastract)

#
scoring.lr <- new("siscreen.IntScore",name="LR",fun = siscreen.lr,params=list(lods=as.matrix(salt.folds),genes=names(salt.folds),pval=FALSE))
hohc <- siscreen(yeastract,scoring.lr,"cor",siscreen.paircluster)
show(hohc)
plot(hohc)

###full example from publication
#filter yeastract graph, removing TFs with less than 10 annotated genes and Tfs with homogenous strongly expressed target genes
tflist <- yeastract[which(sapply(yeastract,length) > 10)]
tflist <- tflist[-which(names(tflist) \%in\% c("GIS1","GAT4","HOT1","SPS18"))]

hohc.paper <- siscreen(tflist,scoring.lr,"cor",siscreen.paircluster,cmeth="average")
#validate using BioGRID database
data(biogridList.71)
hohc.validated <- siscreen.validate.biogrid(hohc.paper,biogridList.71[["all"]])
show(hohc.validated) # 22.03% PPV
plot(hohc.validated) #highlights validated interactions in heatmap
}
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
