\name{ad2.test}
\alias{ad2.test}

\title{Quadratic Class Anderson-Darling test}
\description{
Quadratic class Anderson-Darling test providing a comparison of a fitted distribution
with the empirical distribution.
}
\usage{
ad2.test(x, distn, fit, H = NA, sim = 100, tol = 1e-04, estfun = NA)
}

\arguments{
  \item{x}{a numeric vector of data values}
  \item{distn}{character string naming the null distribution}
  \item{fit}{list of null distribution parameters}
  \item{H}{a treshold value}
  \item{sim}{maximum number of szenarios in the Monte-Carlo simulation}
  \item{tol}{if the difference of two subsequent p-value calculations is lower than \code{tol} the
  Monte-Carlo simulation is discontinued}
  \item{estfun}{an function as character string or \code{NA} (default). See \code{mctest}.}
}

\details{
The Anderson-Darling test compares the null distribution with the empirical distribution
function of the observed data, where left truncated data samples are allowed.
The test statistic is given by
\deqn{AD^2 = -n + 2n \log(1-z_H) -
\frac{1}{n}\sum_{j=1}^n(1+2(n-j))\log(1-z_j) + \frac{1}{n}\sum_{j=1}^n(1-2j)\log(z_j-z_H)}{
AD2 = -n +2n log(1-zH) - 1/n sum(1 + 2(n-j) log(1-zj)) + 1/n sum(1-2j) log(zj-zH)}

with \eqn{z_H = F_\theta(H)}{z_H = F_theta(H)} and \eqn{z_j = F_\theta(x_j)}{
z_j=F_theta(x_j)}, where \eqn{x_1, \dots, x_n} are the ordered data values. Here,
\eqn{F_\theta}{F_theta} is the null distribution.}

\value{
A list with class "mchtest" containing the following components
  \item{statistic}{the value of the Quadratic Class Anderson-Darling statistic}
  \item{treshold}{the treshold value}
  \item{p.value}{the p-value of the test}
  \item{data.name}{a character string giving the name of the data}
  \item{method}{the character string "Quadratic Class Anderson-Darling test"}
  \item{sim.no}{number of simulated szenarios in the Monte-Carlo simulation}
}
\references{Chernobay, A., Rachev, S., Fabozzi, F. (2005), \emph{Composites goodness-of-fit tests
for left-truncated loss samples}, Tech. rep., University of Calivornia Santa Barbara}

\seealso{\code{\link{ad2up.test}}, \code{\link{w2.test}} for other quadratic class tests
and \code{\link{ks.test}}, \code{\link{v.test}}, \code{\link{adup.test}}, \code{\link{ad.test}}
for supremum class tests. For more details see \code{\link{mctest}}.
}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(1000, 2, 2)     # complete sample
xt <- xc[xc >= treshold]      # left truncated sample
ad2.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)
}

\keyword{htest}
