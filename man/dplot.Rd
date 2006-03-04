\name{dplot}
\alias{dplot}

\title{Plot of the distribution functions}
\description{
Plot the empirical against the theoretical distibution function.
}
\usage{
dplot(x, distn, parm, H = NA, verticals = FALSE, ...)
}

\arguments{
  \item{x}{a numeric vector of data samples}
  \item{distn}{character string naming the theoretical distribution function}
  \item{parm}{list of theoretical distribution parameters}
  \item{H}{a treshold value}
  \item{verticals}{see 'plot.stepfun'}
  \item{\dots}{graphical parameters can be given as arguments to \code{plot}}
}
\details{The empirical and the theoretical distribution function specified by the arguments
\code{distn} and \code{parm} are plotted in one single graphic. For truncated data values it is important
to assign the treshold value \code{H}. 
}

\seealso{\code{\link{ecdf}}, \code{\link{plot.ecdf}}, \code{\link{plot.stepfun}}}

\examples{
xc <- rnorm(25)     # complete sample
xt <- xc[xc >= 0]   # left truncated sample

# df of the complete sample
dplot(xc, "pnorm", list(0,1), vertical = TRUE)

# df of the left truncated sample
dplot(xt, "pnorm", list(0,1), H = 0, vertical = TRUE)
}
\keyword{aplot}
