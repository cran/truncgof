\name{edf}
\alias{edf}
\title{Empirical distribution function}
\description{
Empircal distribution function of left truncated data with known distribution.
}
\usage{
edf(x, distn = NA, parm = NA, H = NA)
}

\arguments{
  \item{x}{a numerical vector of data values}
  \item{distn}{character string naming the distribution function}
  \item{parm}{list of distribution parameters}
  \item{H}{a treshold value}
}
\details{\code{edf} is a version of \code{ecdf} allowing left truncated data. 
If \code{distn} is not assigned all other arguments except \code{x} are ignored and the result is 
exactly the same as of \code{ecdf}.
}
\value{
A function of class "stepfun".
}

\seealso{\code{\link{ecdf}}, \code{\link{dplot}}}
\examples{
set.seed(123)
treshold <- 10
xc <- rlnorm(30, meanlog = 2, sdlog = 1)    # complete sample
xt <- xc[xc >= treshold]                    # truncated sample

# the results are identical:
plot(edf(xc))
plot(ecdf(xc))

# considering truncated samples:
plot(edf(xt))   # wrong plot
plot(edf(xt, "plnorm", list(meanlog = 2, sdlog = 1), H = 10))
}
\keyword{dplot}
\keyword{distribution}
