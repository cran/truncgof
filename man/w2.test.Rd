\name{w2.test}
\alias{w2.test}

\title{Cramér-von Mise test}
\description{Cramér-von Mise test providing a comparison of a fitted distribution
with the empirical distribution.
}
\usage{
w2.test(x, distn, fit, H = NA, sim = 100, tol = 1e-04, estfun = NA)
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
The Cramér-von Mies test compares the null distribution with the empirical distribution
function of the observed data, where left truncated data samples are allowed.
The test statistic is given by
\deqn{W^2 = \frac{n}{3} + \frac{n z_H}{1-z_H} +
\frac{1}{n(1-z_H)}\sum_{j=1}^n(1-2j)z_j + \frac{1}{(1-z_H)^2}\sum_{j=1}^{n}(z_j-z_H)^2}{
W2 = n/3 + n zH/(1-zH) + 1/(n (1-zH)) sum((1-2j) zj) + 1/(1-zH)^2 sum(zj-zH)^2}

with \eqn{z_H = F_\theta(H)}{z_H = F_theta(H)} and \eqn{z_j = F_\theta(x_j)}{
z_j=F_theta(x_j)}, where \eqn{x_1, \dots, x_n} are the ordered data values. Here,
\eqn{F_\theta}{F_theta} is the null distribution.}

\value{
A list with class "mchtest" containing the following components
  \item{statistic}{the value of the Cramér-von Mies statistic}
  \item{treshold}{the treshold value}
  \item{p.value}{the p-value of the test}
  \item{data.name}{a character string giving the name of the data}
  \item{method}{the character string "Cramer-von Mies test"}
  \item{sim.no}{number of simulated szenarios in the Monte-Carlo simulation}
}
\references{Chernobay, A., Rachev, S., Fabozzi, F. (2005), \emph{Composites goodness-of-fit tests
for left-truncated loss samples}, Tech. rep., University of Calivornia Santa Barbara}

\seealso{\code{\link{ad2up.test}}, \code{\link{ad2.test}} for other quadratic class tests
and \code{\link{ks.test}}, \code{\link{v.test}}, \code{\link{adup.test}}, \code{\link{ad.test}}
for supremum class tests. For more details see \code{mctest}.
}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
w2.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)
}

\keyword{htest}
