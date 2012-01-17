\name{Screening-class}
\Rdversion{1.1}
\docType{class}
\alias{Screening-class}
\alias{getInteractions,Screening-method}
\alias{getInteractions}
\alias{plot,Screening-method}

\title{Class \code{"Screening"}}
\description{
Class to encapsulate the results from OneHandClapping. As this class extends matrix
it can be handled in a very intuitive way.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("Screening", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{tftarget}:}{Object of class \code{"list"} see \link{yeastract} }
    \item{\code{intscore}:}{Object of class \code{"siscreen.IntScore"} see \linkS4class{siscreen.IntScore}  }
    \item{\code{dfun}:}{Object of class \code{"character"}  }
    \item{\code{clust}:}{Object of class \code{"hclust"} ~~ }
    \item{\code{interactions}:}{Object of class \code{"list"} ~~ }
    \item{\code{cmeth}:}{Object of class \code{"character"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{matrix}"}, from data part.
Class \code{"\linkS4class{array}"}, by class "matrix", distance 2.
Class \code{"\linkS4class{structure}"}, by class "matrix", distance 3.
Class \code{"\linkS4class{vector}"}, by class "matrix", distance 4, with explicit coerce.
}
\section{Methods}{
  \describe{
    \item{getInteractions}{\code{signature(object = "Screening")}: return all interactions predicted by OneHandClapping }
    \item{plot}{\code{signature(x = "Screening")}: plot the results of OnehanClapping (in the form of a heatmap }
	 }
}
\author{
Sebastian Dümcke
}
\note{
This class gets automatically initialized as result of \code{\link{siscreen}}
}

\seealso{
\code{\link{siscreen}}
\code{\linkS4class{Screening.validated}}
}
\examples{
showClass("Screening")
}
\keyword{classes}
