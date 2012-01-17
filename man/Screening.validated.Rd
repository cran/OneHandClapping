\name{Screening.validated-class}
\Rdversion{1.1}
\docType{class}
\alias{Screening.validated-class}
\alias{getValidated,Screening.validated-method}
\alias{getValidated}

\title{Class \code{"Screening.validated"}}
\description{
Class holding data for validated \code{\linkS4class{Screening}}
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("Screening.validated", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{.Data}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{validated}:}{Object of class \code{"list"} list of validated pairs }
    \item{\code{valmethod}:}{Object of class \code{"character"} string giving validation method }
    \item{\code{tftarget}:}{Object of class \code{"list"} same as \code{\linkS4class{Screening}} }
    \item{\code{intscore}:}{Object of class \code{"siscreen.IntScore"} same as \code{\linkS4class{Screening}} }
    \item{\code{dfun}:}{Object of class \code{"character"} same as \code{\linkS4class{Screening}} }
    \item{\code{clust}:}{Object of class \code{"hclust"} same as \code{\linkS4class{Screening}} }
    \item{\code{interactions}:}{Object of class \code{"list"} same as \code{\linkS4class{Screening}} }
    \item{\code{cmeth}:}{Object of class \code{"character"} same as \code{\linkS4class{Screening}} }
  }
}
\section{Extends}{
Class \code{"\linkS4class{Screening}"}, directly.
Class \code{"\linkS4class{matrix}"}, by class "Screening", distance 2.
Class \code{"\linkS4class{array}"}, by class "Screening", distance 3.
Class \code{"\linkS4class{structure}"}, by class "Screening", distance 4.
Class \code{"\linkS4class{vector}"}, by class "Screening", distance 5, with explicit coerce.
}
\section{Methods}{
  \describe{
    \item{getValidated}{\code{signature(object = "Screening.validated")}: returns list of validated interacting TF pairs }
	 }
}
\author{
Sebastian Dümcke
}
\examples{
showClass("Screening.validated")
}
\keyword{classes}
