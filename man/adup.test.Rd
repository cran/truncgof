\name{adup.test}
\alias{adup.test}

\title{Supremum Class Upper Tail Anderson-Darling test}
\description{
Supremum class version of the Upper Tail Anderson-Darling test providing a comparison
of a fitted distribution with the empirical distribution.
}
\usage{
adup.test(x, distn, fit, H = NA, 
          alternative = c("two.sided", "less", "greater"), 
          sim = 100, tol = 1e-04, estfun = NA)
}

\arguments{
  \item{x}{a numeric vector of data values}
  \item{distn}{character string naming the null distribution}
  \item{fit}{list of null distribution parameters}
  \item{H}{a treshold value}
  \item{alternative}{indicates the alternative hypothesis and must be one of
          "two.sided" (default), "less", or "greater".  Initial letter must be specified only.}
  \item{sim}{maximum number of szenarios in the Monte-Carlo simulation}
  \item{tol}{if the difference of two subsequent p-value calculations is lower than \code{tol} the
  Monte-Carlo simulation is discontinued}
  \item{estfun}{an function as character string or \code{NA} (default). See \code{mctest}.}
}
\details{
The supremum class Upper Tail Anderson-Darling test compares the null distribution with the
empirical distribution function of the observed data. The test statistic is given by
\deqn{ADup^+ = \sqrt{n}\sup_j\{\frac{\frac{j}{n}-z_j}{1-z_j}\}}{
    ADup+ = sqrt(n) sup((j/n - zj)/(1 - zj))}
\deqn{ADup^- = \sqrt{n}\sup_j\{\frac{z_j - \frac{j-1}{n}}{1-z_j}\}}{
    ADup- = sqrt(n) sup((zj - (j-1)/n)/(1 - zj))}
\deqn{ADup = \max\{ADup^+, ADup^-\},}{ADup = max(ADup+, ADup-)}

with \eqn{z_H=F_\theta(H)}{zH=F_theta(H)} and \eqn{z_j=F_\theta(x_j)}{zj=F_theta(xj)},
where \eqn{x_1, \dots, x_n} are the ordered data values. Here, \eqn{F_\theta}{F_theta} is the
null distribution.}

\value{
A list with class "mchtest" containing the following components
  \item{statistic}{the value of the Supremum Class Upper Tail Anderson-Darling statistic}
  \item{treshold}{the treshold value}
  \item{p.value}{the p-value of the test}
  \item{data.name}{a character string giving the name of the data}
  \item{method}{the character string "Supremum Class Upper Tail Anderson-Darling test"}
  \item{alternative}{the alternative}
  \item{sim.no}{number of simulated szenarios in the Monte-Carlo simulation}
}
\references{Chernobay, A., Rachev, S., Fabozzi, F. (2005), \emph{Composites goodness-of-fit tests
for left-truncated loss samples}, Tech. rep., University of Calivornia Santa Barbara}

\seealso{\code{\link{ks.test}}, \code{\link{v.test}}, \code{\link{ad.test}}
for supremum class tests and \code{\link{ad2.test}}, \code{\link{w2.test}}
for other quadratic class tests. For more details see \code{mctest}. 
}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
adup.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)
}

\keyword{htest}
