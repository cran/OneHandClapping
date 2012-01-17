\name{yeastract}
\alias{yeastract}
\docType{data}
\title{Yeastract database, TF-target relations}
\description{

This dataset map TF to a set of targets genes. Data is taken from Yeastract (release 2009-04-27)
}

\usage{data(yeastract)}
\format{
List indexed with gene names of TF.
}
\source{
\url{http://www.yeastract.com/download.php}
}
\examples{
data(yeastract)
names(yeastract)
yeastract[["GCN4"]]
}
\keyword{datasets}
