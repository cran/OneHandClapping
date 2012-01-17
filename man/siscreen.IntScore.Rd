\name{siscreen.IntScore-class}
\Rdversion{1.1}
\docType{class}
\alias{siscreen.IntScore-class}
\alias{getFun,siscreen.IntScore-method}
\alias{getFun}
\alias{getParams,siscreen.IntScore-method}
\alias{getParams}

\title{Class \code{"siscreen.IntScore"}}
\description{
This class encapsulate a function computing interaction scores and its arguments.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("siscreen.IntScore", ...)}.
Slot \code{fun} should be a function that returns a numeric value (see \link{siscreen.lr}), slot \code{params} 
a list with all necessary parameters for the function. Note: the first two parameters are always two 
transcription factors.
}
\section{Slots}{
  \describe{
    \item{\code{fun}:}{Object of class \code{"function"} function to calculate an interaction score (see \code{\link{siscreen.lr}}) }
    \item{\code{params}:}{Object of class \code{"list"} a list containing all necessary parameters for the function (excluding the first two, see \code{\link{siscreen.lr}}) }
    \item{\code{name}:}{Object of class \code{"character"} a name for the function, will be stored in the \linkS4class{Screening} object }
  }
}
\section{Methods}{
  \describe{
    \item{getFun}{\code{signature(object = "siscreen.IntScore")}: returns the function stored in this object}
    \item{getParams}{\code{signature(object = "siscreen.IntScore")}: returns the parameter stored in this object }
	 }
}
\author{
Sebastian Dümcke
}
\seealso{
\code{\link{siscreen}}
}
\examples{
showClass("siscreen.IntScore")
}
\keyword{classes}
