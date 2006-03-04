\name{v.test}
\alias{v.test}

\title{Kuiper test}
\description{
Kuiper test providing a comparison of a fitted distribution
with the empirical distribution.
}
\usage{
v.test(x, distn, fit, H = NA, sim = 100, tol = 1e-04, estfun = NA)
}

\arguments{
  \item{x}{a numeric vector of data values}
  \item{distn}{character string naming the null distribution}
  \item{fit}{list of distribution parameters}
  \item{H}{a treshold value}
  \item{sim}{maximum number of szenarios in the Monte-Carlo simulation}
  \item{tol}{if the difference of two subsequent p-value calculations is lower than \code{tol} the
  Monte-Carlo simulation stops}
  \item{estfun}{an function as character string or \code{NA} (default). See \code{mctest}.}
}

\details{
The Kolmogorov-Smirnov test compares the null distribution with the empirical distribution
of the observed data, where left truncated data samples are allowed.
The test statistic (see \code{\link{ks.test}}) is given
by \eqn{V = \max\{KS^+, KS^-\}}{KS = max(KS+, KS-)}.}


\value{
A list with class "mchtest" containing the following components
  \item{statistic}{the value of the Kuiper statistic}
  \item{treshold}{the treshold value}
  \item{p.value}{the p-value of the test}
  \item{data.name}{a character string giving the name of the data}
  \item{method}{the character string "Kuiper test"}
  \item{sim.no}{number of simulated szenarios in the Monte-Carlo simulation}
}
\references{Chernobay, A., Rachev, S., Fabozzi, F. (2005), \emph{Composites goodness-of-fit tests
for left-truncated loss samples}, Tech. rep., University of Calivornia Santa Barbara}

\seealso{\code{\link{ks.test}}, \code{\link{ad.test}}, \code{\link{adup.test}}
for other supremum class tests and \code{\link{ad2.test}}, \code{\link{ad2up.test}},
\code{\link{w2.test}} for quadratic class tests. For more details see \code{mctest}.
}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
v.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)
}

\keyword{htest}
