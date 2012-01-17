\name{siscreen.lr}
\alias{siscreen.lr}
\title{
Interaction Score for OneHandClapping
}
\description{
Interaction score described in Dümcke et al. (NAR 2012)
}
\usage{
siscreen.lr(tf1, tf2, tflist, lods, genes, thresh = 1, pval = FALSE, pvalthresh = 1, norm = FALSE, retcoefs = FALSE)
}
\arguments{
  \item{tf1}{
First transcription factor (argument gets passed by \code{\link{siscreen}} function automatically)
}
  \item{tf2}{
Second transcription factor (argument gets passed by \code{\link{siscreen}} function automatically)

}
  \item{tflist}{
TF-target graph (see \code{\link{biogridList.71}})
}
  \item{lods}{
mRNA folds (see \code{\link{salt.folds}})
}
  \item{genes}{
genes used for calculation of interaction score. Character vector.
}
  \item{thresh}{
threshold in pvalue calculation
}
  \item{pval}{
Should the function return pvalues as interaction score? default is \code{FALSE}
}
  \item{pvalthresh}{
pvalue threshold (default is 1)
}
  \item{norm}{
Should the interaction score be normalized by \code{sd(score)}? default is \code{FALSE}
}
  \item{retcoefs}{
Should all coefficients of the logistic regression be returned i
instead of just the interaction score? Default is \code{FALSE}.  
Setting this to \code{TRUE} is incompatible with a call to siscreen.
}
}
\value{
Returns the interaction score between \code{tf1} and \code{tf2} or a vector with all coefficients 
from the logistic regression if \code{retcoefs = TRUE}
}
\author{
Sebastian Dümcke
}
\note{
This function should not be called explicitly but rather passed to \code{\linkS4class{siscreen.IntScore}} object.
}

\seealso{
\code{\link{siscreen}}, \code{\linkS4class{siscreen.IntScore}}
}
\examples{
data(yeastract)
data(salt.folds)
combn(names(yeastract)[1:10],2,function(p){siscreen.lr(p[1],p[2],yeastract,as.matrix(salt.folds), names(salt.folds))})
\dontrun{
###return all coefficients
coefs = combn(names(yeastract),2,function(p){siscreen.lr(p[1],p[2],yeastract,as.matrix(salt.folds), names(salt.folds),retcoefs=T)},simplify=FALSE)
#and plot them 
library(rgl)
plot3d(x=sapply(coefs,function(v)v[2]),y=sapply(coefs,function(v)v[3]),z=sapply(coefs,function(v)v[4])
  ,xlab="Effect TF1",ylab="Effect TF2",zlab="Effect interaction")
}
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
