\name{orange_county_ro}
\alias{orange_county_ro}

\docType{data}

\title{Reverse Osmosis Membrane Fouling Data}

\description{

The Orange County reverse osmosis (RO) data set contains data from 21 units of RO membranes. They are categorized as seven banks (denoted A-G) which are further split into three parts (1-3). The goals of this data set are to investigate the impact of influent water quality, seasonality, and temperature on membrane fouling in the third stage.

}

\usage{
data(orange_county_ro) #- loads into working environment
orange_county_ro #- a list of data frames
}

\format{
A list with 21 data frames, each of which have 744 rows
and either 127 or 116 columns. There are too many variables to enumerate, and the data frames are derived from numerous data sources, so there are some repeated variables and missing values. Some naming convention tips are as follows: 

\itemize{
\item "Conc" means concentrate: the dirty or reject water exiting the system
\item "Feed" means the influent: the water entering the system
\item "Perm" means the permeate: the cleaned water exiting the system
\item "EC" means the conductivity: this measures amount of salt in the water
}

A few variables of interest are as follows:
\describe{
\item{\code{date}}{}
\item{\code{S3SF}}{Stage 3 specific flux, which decreases with fouling}
\item{\code{ROFTOCavg}}{RO feed total organic carbon daily average}
\item{\code{CIP}}{Clean in place (0 = no cleaning, 1 = cleaning)}
\item{\code{DSS}}{Days since a cleaning}
\item{\code{Days_Since_Replacement}}{Days since membranes have been replaced}
}
}

\source{
Gu Han with the Orange County Water District.
}

\examples{
#- select the first unit
unit1 <- orange_county_ro$A01

#- plot the stage 3 specific flux over time (decreases as filter fouls)
plot(unit1$date, unit1$S3SF, type = "l", main = "filter group A01 stage 3 flux",
     ylab = "stage 3 specfic flux", xlab = "date")

#- overlay points when cleaning occurs
points(unit1$date, unit1$CIP - .9, pch = 19, col = "red")

}

\keyword{datasets}
