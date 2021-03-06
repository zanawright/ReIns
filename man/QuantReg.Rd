\name{QuantReg}
\alias{QuantReg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimator of extreme quantiles in regression
}
\description{
Estimator of extreme quantile \eqn{Q_i(1-p)} in the regression case where \eqn{\gamma} is constant and the regression modelling is thus only solely placed on the scale parameter.
}
\usage{
QuantReg(Z, A, p, plot = FALSE, add = FALSE, 
         main = "Estimates of extreme quantile", ...)
}
\arguments{
  \item{Z}{
Vector of \eqn{n} observations (from the response variable). 
}
  \item{A}{
Vector of \eqn{n-1} estimates for \eqn{A(i/n)} obtained from \code{\link{ScaleReg}}.
}
  \item{p}{
The exceedance probability of the quantile (we estimate \eqn{Q_i(1-p)} for \eqn{p} small).
}
  \item{plot}{
Logical indicating if the estimates should be plotted as a function of \eqn{k}, default is \code{FALSE}.
}
  \item{add}{
Logical indicating if the estimates should be added to an existing plot, default is \code{FALSE}.
}
  \item{main}{
Title for the plot, default is \code{"Estimates of extreme quantile"}.
}
  \item{\dots}{
Additional arguments for the \code{plot} function, see \code{\link[graphics:plot.default]{plot}} for more details.
}
}
\details{
The estimator is defined as
\deqn{\hat{Q}_i(1-p) = Z_{n-k,n} ((k+1)/((n+1)\times p) \hat{A}(i/n))^{H_{k,n}},}
with \eqn{H_{k,n}} the Hill estimator. Here, it is assumed that we have equidistant covariates \eqn{x_i=i/n}.

See Section 4.4.1 in Albrecher et al. (2017) for more details. 
}
\value{
A list with following components:
\item{k}{Vector of the values of the tail parameter \eqn{k}.}
\item{Q}{Vector of the corresponding quantile estimates.}
\item{p}{The used exceedance probability.}
}
\references{
Albrecher, H., Beirlant, J. and Teugels, J. (2017). \emph{Reinsurance: Actuarial and Statistical Aspects}, Wiley, Chichester.
}
\author{
Tom Reynkens.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{ProbReg}}, \code{\link{ScaleReg}}, \code{\link{Quant}}
}
\examples{
data(norwegianfire)

Z <- norwegianfire$size[norwegianfire$year==76]

i <- 100
n <- length(Z)

# Scale estimator in i/n
A <- ScaleReg(i/n, Z, h=0.5, kernel = "epanechnikov")$A

# Small exceedance probability
q <- 10^6
ProbReg(Z, A, q, plot=TRUE)

# Large quantile
p <- 10^(-5)
QuantReg(Z, A, p, plot=TRUE)
}

