\name{biogridList.71}
%%\alias{biogridList}
\alias{biogridList.71}
\docType{data}
\title{TF interactions from BioGRID}
\description{

All interactions between TF from Yeastract (release XX, see \code{\link{yeastract}}) in 
Version 3.1.71 of the BioGRID database 
}

\usage{data(biogridList.71)}
\format{
List with three components:

genetic: only interactions of type 'genetic'
physical: only interactions of type 'physical'
all: union of the 2 previous entries

Each component is an nx2 matrix with a gene name in each column

}
\source{
\url{http://thebiogrid.org/downloads/archives/Release\%20Archive/BIOGRID-3.1.71/BIOGRID-ORGANISM-3.1.71.tab2.zip}
}
\examples{
data(biogridList.71)
sapply(biogridList.71, dim)
head(biogridList.71[["all"]])
}
\keyword{datasets}
