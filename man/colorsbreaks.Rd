\name{colorsbreaks}
\alias{colorsbreaks}
\title{
Generate color palette and breaks for heatmaps
}
\description{
This function generates a symmetric color transition (optionally stretched around the midpoint) and 
matching breaks for use in heatmaps.
}
\usage{
colorsbreaks(range, maincols, granularity, midpoint = 0, rev = F, damp = 0.05)
}
\arguments{
  \item{range}{
vector, c(min,max) values of the data
}
  \item{maincols}{
three main colors. The colors will fade from \code{maincols[1]} to \code{maincols[3]} over \code{maincols[2]}
(See examples)
}
  \item{granularity}{
This controls the number of breaks and colors returned by the method. They will be \code{2*granularity}
}
  \item{midpoint}{
will be assigned \code{maincols[2]}. \code{range[1] < midpoint < range[2]}, default 0
}
  \item{rev}{
if TRUE reverse the colors. default: \code{FALSE}
}
  \item{damp}{
dampening around midpoint. This stretches \code{maincols[2]} so that extreme values are more prominent. default: \code{0.05}
}
}
\value{
Returns a list with two components:
  \item{col}{color vector}
  \item{breaks}{correspondings breaks}
}
\author{
Sebastian Dümcke
}

\examples{
x <- matrix(runif(200, min=-3,max=1),ncol=10,nrow=20) ##shifted normal distribution
cb <- colorsbreaks(range(x),c("red","white","blue"),10,damp=0)
heatmap(x,scale="none",col=cb$col,breaks=cb$breaks) 

cb <- colorsbreaks(range(x),c("red","white","blue"),100,damp=0.9)
heatmap(x,scale="none",col=cb$col,breaks=cb$breaks) 

}
\keyword{ color }
