\name{precip_type}
\alias{precip_type}

\docType{data}

\title{Precipitation Study: predictors}

\description{
\code{precip_type} is a data set of 18 years of weather
condition data from the continental United States and Alaska. Each year contains the months Jan, Feb, Mar, Apr, May, Sep, Oct, Nov, & Dec. The summer months are excluded because the precipitation that occurs in the summer is almost exclusively rain. 551 stations are used in this study and the original purpose of the data set is to use atmospheric conditions and spatial data for predictive classification of precipitation type. 
}

\usage{
#- download precip_type.rda from Google drive
load("path/precip_type.rda") #- loads into working environment
precip_type$precip #- precipitation data
precip_type$predictors #- various predictor variables
}

\format{
A list containing a data frame and a list.

\strong{(1)} \code{precip_type$precip} is a data frame with 7,139,951 rows and 5 columns. The variables are as follows:

\describe{
\item{\code{type}}{Type of precipitation (freezing rain (FZRA), ice pellets (IP), rain (RA), or snow(SN))}
\item{\code{Date.Time}}{}
\item{\code{station}}{}
\item{\code{altitude}}{There are 31 unique altitudes}
\item{\code{temp}}{}
}

\strong{(2)} \code{precip_type$predictors} is a list with 9 elements that contain various predictor data objects. The elements are described as follows:

\describe{
\item{\code{Twb.prof}}{The vertical profiles of temperature (0m to 3000m above the surface in steps of 100m) in Kelvin}
\item{\code{date.ind}}{Date time index (1 to 4660)}
\item{\code{Date.Time}}{Date corresponding to the index}
\item{\code{elev}}{Station elevation (m)}
\item{\code{lat}}{Station latitude}
\item{\code{lon}}{Station longitude}
\item{\code{ptype}}{Precipitation type per profile ? }
\item{\code{station.ind}}{Station index (1 to 551)}
\item{\code{stations}}{Full station ID corresponding to the index}
}

}

\source{
Michael Scheuerer from NOAA’s Earth System
Research Laboratories (ESRL) division, The US National
Atmospheric and Oceanic Administration (NOAA) https://www.ncdc.noaa.gov
}

\examples{

data("precip_type")

Twb.prof <- precip_type$predictors$Twb.prof
ptype <- precip_type$predictors$ptype

step.size <- seq(0, 3000, by = 100)
xlims <- range(Twb.prof[1:100, ])

#Ice Pellet Profiles
pellet <- which(ptype == "IP")
xlims <- range(Twb.prof[pellet,])
plot(Twb.prof[1,], step.size, xlab = "Temperature (K)", ylab = "Meters AGL", type = "n", xlim = xlims, col = rgb(0,0,0,.1))
title("Ice Pellet Profiles",cex.main = 2)
abline(v = 273.15, col = 2, lwd = 2)
for(i in 1:length(pellet)){
  lines(Twb.prof[pellet[i],],step.size,col=rgb(0,0,0,.1))
}

}

\keyword{datasets}
