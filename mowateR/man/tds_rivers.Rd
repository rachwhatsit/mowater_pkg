\name{tds_rivers}
\alias{tds_rivers}

\docType{data}

\title{Colorado River Total Dissolved Solids}

\description{
\code{tds_rivers} is a time series data set of total dissolved solids in the Colorado river, measured at Lees and Hoover dams. This data set contains the total dissolved solids (TDS) at the outflow of Lake Powell (called ‘lees’) and Lake Mead (called ‘hoover’). It has 672 observations of TDS at both locations along with the date. The observations are collected at the end of each month, beginning in 1963 and ending in 2018. The TDS values from the data set are estimated from a model that uses flow and conductivity; they are not measured directly from the water.
}

\usage{
data(tds_rivers) #- loads into working environment
tds_rivers
}

\format{
A data frame with 672 rows and 3 variables: datetime and TDS in Lees dam and Hoover dam.
}

\source{
US Bureau of Reclamation.
Available online: usbr.gov/lc/region/g4000/NaturalFlow/supportNS.html
}

\examples{
data(tds_rivers)

plot(tds_rivers$Date.Time, tds_rivers$lees, type = "l")

}

\keyword{datasets}
