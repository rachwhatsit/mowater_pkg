\name{aqua_filter}
\alias{aqua_filter}

\docType{data}

\title{Aqua Aerobic Cloth Filter Data}

\description{
\code{aqua_filter} is a data set that measures the performance of cloth filters for
primary filtration, a novel approach to treat more waste water
with a smaller physical footprint than a traditional primary clarifier.
The Linda County Water District WWTP has operated a cloth filter
unit since 2017.
}

\usage{
data(aqua_filter) #- loads into working environment
aqua_filter
}

\format{
A list containing two data sets of lab and online data.

\strong{(1)} \code{aqua_filter$lab} is a 258 by 16 data frame with chemical measurements taken from lab samples. Two important variables are described below:

\describe{
\item{\code{Depth}}{Measured in meters from surface (m)}
\item{\code{GeosminEntry}}{Geosmin measurement (ng/L)}
}

\strong{(2)} \code{aqua_filter$daily_averages_online} is a 363 by 26 data frame with daily operational averages  of variables like flow and turbidity.



}

\source{
Terry Reid of Aqua-Aerobic Systems, Inc. from their
full-scale primary cloth depth filter installation in the
Linda County Water District Wastewater Treatment Plant
}

\examples{
data(aqua_filter)

#- compare the influent and waste flow from online data
online <- aqua_filter$daily_averages_online

par(mfrow = c(2, 1))
plot(online$Date, online$adfs_influent_flow_process_value, type = "l",
     main = "Influent Flow", ylab = "Influent Flow", xlab = "Date", 
     ylim = c(0, 1100))
plot(online$Date, online$adfs_waste_flow_process_value, type = "l", 
     main = "Waste Flow", ylab = "Waste Flow", xlab = "Date",
     ylim = c(0, 1100))
}



\keyword{datasets}
