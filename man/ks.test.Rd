\name{ks.test}
\alias{ks.test}

\title{Kolmogorov-Smirnov test}
\description{
Kolmogorov-Smirnov test providing a comparison of a fitted distribution
with the empirical distribution.
}
\usage{
ks.test(x, distn, fit, H = NA, 
        alternative = c("two.sided", "less", "greater"), 
        sim = 100, tol = 1e-04, estfun = NA)
}
\arguments{
  \item{x}{a numeric vector of data values}
  \item{distn}{character string naming the null distribution}
  \item{fit}{list of null distribution parameters}
  \item{H}{a treshold value}
  \item{alternative}{indicates the alternative hypothesis and must be one of
          "two.sided" (default), "less", or "greater". Initial letter must be specified only.}
  \item{sim}{maximum number of szenarios in the Monte-Carlo simulation}
  \item{tol}{if the difference of two subsequent p-value calculations is lower than \code{tol} the
  Monte-Carlo simulation is discontinued}
  \item{estfun}{an function as character string or \code{NA} (default). See \code{mctest}.}
}
\details{
The Kolmogorov-Smirnov test compares the null distribution with the empirical distribution 
function of the observed data, where left truncated data samples are allowed. 
The test statistic is given by
\deqn{KS^+ = \frac{\sqrt{n}}{1-z_H}\sup_j\{z_H + \frac{j}{n}(1-z_H)-z_j\}}{
    KS+ = sqrt(n)/(1-zH) sup(zH + j/n (1-zH) -zj)}
\deqn{KS^- = \frac{\sqrt{n}}{1-z_H}\sup_j\{z_j -(z_H + \frac{j-1}{n}(1-z_H))\}}{
    KS+ = sqrt(n)/(1-zH) sup(zj - (zH + (j-1)/n (1-zH)))}
\deqn{KS = \max\{KS^+, KS^-\},}{KS = max(KS+, KS-)}

with \eqn{z_H = F_\theta(H)}{z_H = F_theta(H)} and \eqn{z_j = F_\theta(x_j)}{
z_j=F_theta(x_j)}, where \eqn{x_1, \dots, x_n} are the ordered data values. Here,
\eqn{F_\theta}{F_theta} is the null distribution.}

\value{
A list with class "mchtest" containing the following components
  \item{statistic}{the value of the Kolmogorov-Smirnov statistic}
  \item{treshold}{the treshold value}
  \item{p.value}{the p-value of the test}
  \item{data.name}{a character string giving the name of the data}
  \item{method}{the character string "Kolmorov-Smirnov test"}
  \item{alternative}{the alternative}
  \item{sim.no}{number of simulated szenarios in the Monte-Carlo simulation}
}
\references{Chernobay, A., Rachev, S., Fabozzi, F. (2005), \emph{Composites goodness-of-fit tests
for left-truncated loss samples}, Tech. rep., University of Calivornia Santa Barbara}

\seealso{\code{\link{ad.test}}, \code{\link{v.test}}, \code{\link{adup.test}}
for other supremum class tests and \code{\link{ad2.test}}, \code{\link{ad2up.test}},
\code{\link{w2.test}} for quadratic class tests. For more details see \code{\link{mctest}}.
}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)     # complete sample
xt <- xc[xc >= treshold]     # left truncated sample
ks.test(xt, "plnorm", list(meanlog = 2, sdlog = 2), H = 10)
}

\keyword{htest}
