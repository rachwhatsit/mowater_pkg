\name{boulder_phos}
\alias{boulder_phos}

\docType{data}

\title{Boulder Facility Data: Phosphorus}

\description{
\code{boulder_phos} is a data set from Boulder Waste Water Treatment Plant used for
predicting phosphorous in the effluent flow.
}

\usage{
boulder_phos
data(boulder_phos) #- loads into working environment
}

\format{
A list with seven data frames of flow data, phosphorous measurement, and grab sample results.

\strong{(1)} \code{boulder_phos$avg_9_to_10_daily} is a 183 by 16 data frame with daily flow data averages.

\strong{(2)} \code{boulder_phos$dosing_daily} is a 215 by 7 data frame with daily chemical dosing measurements.

\strong{(3)} \code{boulder_phos$flow_hourly} is a 183 by 16 data frame with daily flow data averages.

\strong{(4)} \code{boulder_phos$lab_daily} is a 214 by 95 data frame with daily aqueous lab and solids lab data.

\strong{(5)} \code{boulder_phos$mixed_liqour_hourly} is a 121 by 4 data frame with hourly mixed liquor channel profile data.

\strong{(6)} \code{boulder_phos$phosfax_10m} is a 17,887 by 2 data frame with effluent phosphorus measurements.

\strong{(7)} \code{boulder_phos$total_flow_daily} is a 184 by 20 data frame with daily totalized flows.

}

\source{
Christopher Marks for the City of Boulder Water Resource Recovery Facility (BWRRF)
}

\examples{
data(boulder_phos)

#- Alum
dose   <- boulder_phos[[2]]
alum   <- dose[which(dose$coagulant == "Alum"),]

plot(alum$Date, alum$solution_mass_lbs_day, type = "l",
main = "Alum Addition", ylab = "Mass", xlab = "Date")

#- Phosphorus
phos <- boulder_phos[[6]]
plot(phos$Date.Time, phos$op_conc_mg_p_l, type = "l", ylim = c(0, 6))

}
\keyword{datasets}
