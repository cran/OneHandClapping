\name{siscreen.validate.biogrid}
\alias{siscreen.validate.biogrid}
\title{
Validation using BioGRID for OnehandClapping
}
\description{
Function to validate predictions made by OneHandClapping
}
\usage{
siscreen.validate.biogrid(siscreen, biogrid)
}
\arguments{
  \item{siscreen}{
Result from \code{\link{siscreen}} function
}
  \item{biogrid}{
Validation data. nx2 matrix, see \link{biogridList.71}
}
}
\value{
\code{\linkS4class{Screening.validated}} object.
}
\author{
Sebastian Dümcke
}
\seealso{
Examples in \code{\link{siscreen}}, \code{\linkS4class{Screening.validated}}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
