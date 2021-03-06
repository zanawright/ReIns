\name{Moment}
\alias{Moment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Moment estimator
}
\description{
Compute the moment estimates for real extreme value indices as a function of the tail parameter \eqn{k}. Optionally, these estimates are plotted as a function of \eqn{k}.
}
\usage{
Moment(data, logk = FALSE, plot = FALSE, add = FALSE, 
       main = "Moment estimates of the EVI", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
  Vector of \eqn{n} observations. 
}
  \item{logk}{
Logical indicating if the estimates are plotted as a function of \eqn{\log(k)} (\code{logk=TRUE}) or as a function of \eqn{k}. Default is \code{FALSE}.
}
  \item{plot}{
Logical indicating if the estimates should be plotted as a function of \eqn{k}, default is \code{FALSE}.
}
  \item{add}{
Logical indicating if the estimates should be added to an existing plot, default is \code{FALSE}.
}
  \item{main}{
Title for the plot, default is \code{"Moment estimates of the EVI"}.
}
  \item{\dots}{
Additional arguments for the \code{plot} function, see \code{\link[graphics:plot.default]{plot}} for more details.
}
}
\details{
The moment estimator for the EVI is introduced by Dekkers et al. (1989) and is a generalisation of the Hill estimator. 

See Section 4.2.2 of Albrecher et al. (2017) for more details.
}

\value{
A list with following components:
\item{k}{Vector of the values of the tail parameter \eqn{k}.}
\item{gamma}{Vector of the corresponding moment estimates.}
}

\references{
Albrecher, H., Beirlant, J. and Teugels, J. (2017). \emph{Reinsurance: Actuarial and Statistical Aspects}, Wiley, Chichester.

Beirlant J., Goegebeur Y., Segers, J. and Teugels, J. (2004). \emph{Statistics of Extremes: Theory and Applications}, Wiley Series in Probability, Wiley, Chichester.

Dekkers, A.L.M, Einmahl, J.H.J. and de Haan, L. (1989). "A Moment Estimator for the Index of an Extreme-value Distribution." \emph{Annals of Statistics}, 17, 1833--1855.
}
\author{
Tom Reynkens based on \code{S-Plus} code from Yuri Goegebeur.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Hill}}, \code{\link{genHill}}
}
\examples{
data(soa)

# Hill estimator
H <- Hill(soa$size, plot=FALSE)
# Moment estimator
M <- Moment(soa$size)
# Generalised Hill estimator
gH <- genHill(soa$size, gamma=H$gamma)

# Plot estimates
plot(H$k[1:5000], M$gamma[1:5000], xlab="k", ylab=expression(gamma), type="l", ylim=c(0.2,0.5))
lines(H$k[1:5000], gH$gamma[1:5000], lty=2)
legend("topright", c("Moment", "Generalised Hill"), lty=1:2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

