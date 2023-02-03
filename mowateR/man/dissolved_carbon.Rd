\name{dissolved_carbon}
\alias{dissolved_carbon}

\docType{data}

\title{Dissolved Organic Carbon Baseflow}

\description{
\code{dissolved_carbon} is a data set of U.S. Geological Survey measurements taken from 1983 to 2012 in the months of September, October and November. The goal of the data set is to model dissolved organic carbon measured from Rocky Mountain streams.
}

\usage{
data(dissolved_carbon) #- loads into working environment
dissolved_carbon$baseflow #- baseflow data frame
dissolved_carbon$usgs #- stations data frame
}

\format{
A list containing two data frames. 

\strong{(1)} \code{dissolved_carbon$baseflow} is a spatial data frame with 1,174 rows and 32 columns, including variables like location, flow, landcover, and more. 

\strong{(2)} \code{dissolved_carbon$usgs} is a data frame with 2,900 rows and 5 columns with variables as follows:

\describe{
\item{\code{Date}}{}
\item{\code{Longitude}}{}
\item{\code{Latitude}}{}
\item{\code{Station_ID}}{Station where the measurement occured}
\item{\code{DOC}}{Dissolved organic carbon measurement}
}

}

\source{
\strong{(1)} Water Data for the Nation: The National Water Information System. Available online: https://waterdata.usgs.gov/nwis

\strong{(2)} Rodríguez-Jeangros N, Hering AS, McCray JE. Analysis of Anthropogenic, Climatological, and Morphological Influences on Dissolved Organic Matter in Rocky Mountain Streams. Water. 2018; 10(4):534. https://doi.org/10.3390/w10040534
}

\examples{
data(dissolved_carbon)
 
usgs <- dissolved_carbon$usgs

ord_ndx <- order(usgs$Date)

plot(usgs$Date[ord_ndx], usgs$DOC[ord_ndx], type = "l",
     main = "DOC over time", xlab = "Date", ylab = "DOC")
}

\keyword{datasets}
