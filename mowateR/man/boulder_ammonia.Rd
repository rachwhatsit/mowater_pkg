\name{boulder_ammonia}
\alias{boulder_ammonia}

\docType{data}

\title{Boulder Facility Data: Ammonia}

\description{
\code{boulder_ammonia} is a data set of water quality measurements at numerous locations
in a water treatment facility. The facility is divided into nine zones. Multiple probes are used measure dissolved oxygen, ammonia, and nitrate.
}


\usage{
boulder_ammonia
data(boulder_ammonia) #- loads into working environment
}

\format{
A data frame  with 25,908 rows and 16 columns. The variable naming convention used is "aerationbin.zone.variable."
}

\source{
Christopher Marks for the City of Boulder Water Resource Recovery Facility (BWRRF)
}

\examples{
data(boulder_ammonia)

ammonia <- boulder_ammonia[,11]
length(ammonia)
ts.plot(ammonia)
ts.plot(ammonia[24000:25908])
hist(ammonia)
hist(ammonia,breaks="FD")
}
\keyword{datasets}
