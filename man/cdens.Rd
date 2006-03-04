\name{cdens}
\alias{cdens}

\title{Build a conditional density function}

\description{
For a given distribution function \code{cdens} builds a conditional density function
with respect to a relevant treshold.
}
\usage{cdens(distn, H)
}
\arguments{
  \item{distn}{character string naming the distribution function for which the
    conditional density is to be built}
  \item{H}{a treshold value}
}
\details{
For \eqn{x \geq H}{x >= H} the conditional density \eqn{f^\ast}{f*} of a density \eqn{f} is given by
\deqn{f^\ast_\theta(x) = f(x|x \geq H)=\frac{f_\theta(x)}{1-F_\theta(H)},}{
    f*_theta(x) = f(x|x>=H) = f_theta(x)/(1-F_theta(x)),}
with \eqn{\theta}{theta} the parameters of the distribution, \eqn{F} the
cumulative distribution function and \eqn{H} the treshhold value. For \eqn{x < H}, \eqn{f^\ast}{f*}
disappear.
}
\value{
The conditional density of the specified density function with arguments \code{x}, the relevant
parameters and the treshold \code{H} predefined as the value of cdens' argument \code{H}. \code{x}
can be a numeric value or numeric vector, but must be greater or equal to \code{H}.
}

\seealso{density functions, e.g. \code{\link{dlnorm}}, \code{\link{dgamma}}, etc.}
\examples{
set.seed(123)
treshold <- 10
xc  <- rlnorm(100, 2, 2)   # complete sample
xt <- xc[xc >= treshold]   # left truncated sample

clnorm <- cdens("plnorm", H = treshold)
args(clnorm)

# mle fitting based on the complete sample
start <- list(meanlog = 2, sdlog = 1)
MASS::fitdistr(xc, dlnorm, start = start)

# mle fitting based on the truncated sample
MASS::fitdistr(xt, clnorm, start = start)

# in contrast
MASS::fitdistr(xt, dlnorm, start = start)
}

\keyword{distribution}
