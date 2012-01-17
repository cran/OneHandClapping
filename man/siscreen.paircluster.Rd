\name{siscreen.paircluster}
\alias{siscreen.paircluster}
\title{
Prediction Funtion for OneHandClapping
}
\description{
Given a clustering dendrogram, this function returns pairs of interacting TFs.
}
\usage{
siscreen.paircluster(dendrog)
}
\arguments{
  \item{dendrog}{
dendrogram issued from \code{hclust} call
}
}
\details{
The algorithm is a depth-first descent down the dendrogram until it encounters 
a node containint tow leafs. These are collected. All collected leafs are returned.
}
\value{
List of pairs
}
\author{
Sebastian Dümcke
}
\note{
Function is used by \code{\link{siscreen}} to extract prediction from clustering of interaction scores.
}

\seealso{
\code{\link{siscreen}}
}
\examples{
hc = hclust(dist(USArrests), "ave")
siscreen.paircluster(as.dendrogram(hc))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
