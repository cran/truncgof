\name{mctest}
\alias{mctest}
\title{Monte-Carlo simulation based GoF test}
\description{
Performs Monte-Carlo based Goodness-of-Fit tests. \code{mctest} is called by the GoF tests
defined in this package. For internal use only.
}
\usage{
mctest(x, distn, parm, H, sim, tol, STATISTIC, estfun)
}
\arguments{
  \item{x}{numerical vector of data values}
  \item{distn}{character string specifying the null distribution}
  \item{parm}{parameters of the null distribution}
  \item{H}{a treshold value}
  \item{sim}{maximum number of szenarios within the Monte-Carlo-Simulation}
  \item{tol}{if the difference of two subsequent p-value calculations is lower than \code{tol} the
  Monte-Carlo simulation stops}
  \item{STATISTIC}{function of the test statistic}
  \item{estfun}{an function as character string or \code{NA}, see details.}
}
\details{
From the fitted null distribution \code{mctest} draws samples each with length
of the observed sample \code{x} and with treshold \code{H}. The random numbers are
taken from the conditional distribution with support \eqn{[H, \infty)}{[H, +Inf)}. The maximum
number of samples is specified by \code{sim}. For
each of these samples the conditional distribution is fitted and the statistic given in
\code{STATISTIC} is calculated. The p-value is the proportion of times the sample statistics
values exceed the statistic value of the observed sample. 

For each szenario sample \code{mctest} uses a Maximum-likelihood fitting of the
distribution \code{distn} as default. This is done by direct optimization of the log-likelihood 
function using \code{optim}.

Alternativly the fitting parameters for the szenario samples might be estimated with a user-specified
function assigned in \code{estfun}. It must be a function with argument \code{x} (and \code{H}
if desired) which can be parsed. The return value of the evaluated function
must be a list with the parameters which should be fitted. Inside \code{mctest} the evaluation of
\code{estfun} is performed with \code{H} as assigned in the call of \code{mctest} and \code{x} the
szenario sample.

By assigning a function to \code{estfun}, the fitting procedure can be done faster and more
appropriate to a given problem. The 'evir' package for example defines a function \code{gpd} to fit the
Generalized Pareto Model. To start a test it is more reasonable to set \code{estfun = gpd(x, y)},
where \code{y} must be a defined numeric value.
}
\value{
named list of
  \item{TS}{value of the test statistic for \code{x}}
  \item{p.value}{Monte-Carlo simulation based p-value of the statistic}
  \item{sim}{number of simulated szenarios in the Monte-Carlo simulation}
}
\references{Chernobay, A., Rachev, S., Fabozzi, F. (2005), \emph{Composites goodness-of-fit tests
for left-truncated loss samples}, Tech. rep., University of Calivornia Santa Barbara

Ross, S. M. (2002), \emph{Simulation}, 3rd Edition, Academic Press. Pages 205-208.
}

\seealso{\code{\link{ad2.test}}, \code{\link{ad2up.test}}, \code{\link{w2.test}} 
for quadratic class GoF tests and \code{\link{ks.test}}, \code{\link{v.test}}, 
\code{\link{adup.test}}, \code{\link{ad.test}} for supremum class GoF tests.
}
\examples{
set.seed(123)
treshold <- 10
xc <- rgamma(100, 20, 2)    # complete sample
xt <- xc[xc > treshold]     # left truncated sample

## function for parameter fitting
estimate <- function(x, H){
    cgamma <- cdens("pgamma", H)
    ll <- function(p, y) {
        res <- -sum(do.call("cgamma", list(c(y), p[1], p[2], log = TRUE)))
        if (!is.finite(res)) return(-log(.Machine$double.xmin)*length(x))
        return(res)
    }
    est <- optim(c(1,1), ll, y = x, lower = c(.Machine$double.eps, 0), 
                 method = "L-BFGS-B")
    as.list(est$par)
}

fit <- estimate(xt, treshold)
cat("fitting parameters:", unlist(fit), "\n")

## calculate p-value with fitting algorithm defined in 'mctest' ...
ad2up.test(xt, "pgamma", fit, H = treshold,  estfun = NA, tol = 1e-02)

## ... or with the function 'estimate'
ad2up.test(xt, "pgamma", fit, H = treshold, estfun = "estimate(x, H)", 
           tol = 1e-02)      

## not run:
## if the 'evir' package is loaded:
## ad.test(xt, "pgpd", list(2,3), H = treshold,  
##         estfun = "as.list(gpd(x, 0)$par.ests)", tol = 1e-02)
}

\keyword{htest}
