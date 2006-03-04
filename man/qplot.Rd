\name{qplot}
\alias{qplot}

\title{QQ-Plot}
\description{Adjusted QQ-Plot allowing for left-truncated data values.
}
\usage{
qplot(x, distn, parm, H = NA, plot.it = TRUE, main = "QQ-Plot", 
      xlab = "empirical quantiles", ylab = "theoretical quantils", ...)
}

\arguments{
  \item{x}{a numeric vector of data values}
  \item{distn}{character string of the distribution}
  \item{parm}{list of distribution parameters}
  \item{H}{a treshold value}
  \item{plot.it}{logical. \code{TRUE} (default) if the result is to be plotted.}
  \item{xlab, ylab, main}{plot labels}
  \item{\dots}{further graphical parameters}
}

\seealso{\code{\link{dplot}}, \code{\link{cdens}}}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample

# for not assigned treshold the folliwing 
# graphics are identical but not usefull
par(mfrow = c(2,1))
y <- qlnorm(ppoints(length(xt)), 2, 2)
qplot(xt, "plnorm", list(2,2))
qqplot(xt, y); abline(0,1)

# fot trucated data rather use
qplot(xt, "plnorm", list(2,2), H = 10)

}
\keyword{aplot}
