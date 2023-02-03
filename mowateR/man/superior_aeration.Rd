\name{superior_aeration}
\alias{superior_aeration}

\docType{data}

\title{Aeration Basin Biomass Comparison Data}

\description{
The \code{superior_aeration} data comes from the Rock Creek WWTP
which is a conventional treatment plant
built in 1989 with very little instrumentation. To adjust
operation, the total mass of solids in the system is
measured and compared to a target. If the amount of
solids is greater than the target, the solids are removed
from the system by "wasting."" If the amount of solids is
less than the target, no solids are wasted. In cases where the
amount of solids is less than the target, it is possible that
the micro-organisms cannot grow fast enough. This is most
likely due to low concentrations of food (measured as BOD
in the influent). The total biomass in the system is also
related to ammonia transformation/removal. A minimum “sludge age”
(e.g., average time biomass grows in the system, solids retention
time, solids detection time) is needed to remove ammonia and
nitrate, but if the biomass stays in the system too long,
bad micro-organisms can take over that compete with the
"good" micro-organisms for food.
The goal of this data set is to compare the outcome of two aeration basins.
}

\usage{
data(superior_aeration)  #- loads into working environment
superior_aeration$overview #- first data frame
superior_aeration$process_control #- second data frame
superior_aeration$online #- third data frame
}

\format{
A list that contains three data
frames.

\strong{(1)} \code{superior_aeration$overview} is a data frame with 880 rows and 68 columns containing influent/effluent sample time and chemical measurements.

\strong{(2)} \code{superior_aeration$process_control} is a data frame with 871 rows and 107 columns containing wasting, mass, flow, and mass balance measurements.

\strong{(3)} \code{superior_aeration$online} is a data frame with 400,883 rows and 5 columns with online oxygen data.

}

\source{
Wayne Ramey and Ryan Wienpahl of Ramey Environmental
Consulting for the City of Superior, Colorado Rock Creek
Wastewater Treatment Plant.
}

\examples{

data(superior_aeration)

online <- superior_aeration$online

#- compare ORP from east and west bins
par(mfrow = c(2, 1))
plot(online$Date.Time[order(online$Date.Time)], online$orp_east[order(online$Date.Time)],
     type = "l", main = "East Oxidation Reduction Potential",
     xlim = "Date", ylim = "ORP")

plot(online$Date.Time[order(online$Date.Time)], online$orp_west[order(online$Date.Time)], 
     type = "l", main = "West Oxidation Reduction Potential",
     xlim = "Date", ylim = "ORP"))


}

\keyword{datasets}
