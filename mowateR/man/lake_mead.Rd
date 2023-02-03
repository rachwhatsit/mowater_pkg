\name{lake_mead}
\alias{lake_mead}

\docType{data}

\title{Lake Mead Event Classification}

\description{
\code{lake_mead} is a time series of roughly 16 days of observations measured every 15 minutes. Water was spiked with either (i) treated wastewater, (ii) water from the Las Vegas Wash during dry events or (iii) water from the Las Vegas Wash during storm events. There was one spike of each type within the train and test set (for a total of 6 spikes). The water was sampled from a water intake deep in the middle of Lake Mead. 
}

\usage{
data(lake_mead) #- loads into working environment
lake_mead
}

\format{
A data frame with 1,561 rows and 13 columns.

\describe{
\item{\code{datetime}}{}
\item{\code{ph}}{}
\item{\code{orp_mV}}{Redox Potential: Indicates the tendency of chemicals in the water to be reduced or oxidized.}
\item{\code{temp_F}}{Temperature (F)}
\item{\code{turb_NTU}}{Turbidity (NTU)}
\item{\code{cond_uScm}}{Conductivity in micro-Siemens per cm}
\item{\code{algae_ugL}}{Estimate of chlorophyll (how green the water is)}
\item{\code{toc_mgL}}{Total organic carbon}
\item{\code{uva254_1cm}}{Amount of light water absorbs at 254 nanometers}
\item{\code{trypto_interp}}{Interpolated tryptophan (unitless)}
\item{\code{label1}}{event vs. non-event vs. maintenance}
\item{\code{label2}}{specific type of event (specific version of \code{label1})}
\item{\code{set}}{denotes train or test set}
}
}

\source{
Eric Dickenson and Kyle Thompson of Southern Nevada Water Authority.
}

\examples{
data(lake_mead)
#- split into test and train
train_set <- which(lake_mead$set=="train")
test_set <- which(lake_mead$set=="test")

#- plot the events
par(mfrow = c(1,2))
subset1 <- which(lake_mead$set=="train" & lake_mead$label1 =="event")
plot(lake_mead$datetime[train_set], lake_mead$turb_NTU[train_set], type="l", xlab="Date", ylab="Turbidity (NTU)", ylim = c(0, 2))
points(lake_mead$datetime[subset1], lake_mead$turb_NTU[subset1], pch=19, col="blue")
title("Train")

subset2 <- which(lake_mead$set=="test" & lake_mead$label1 =="event")
plot(lake_mead$datetime[test_set], lake_mead$turb_NTU[test_set], type="l", xlab="Date", ylab="", ylim = c(0, 2))
points(lake_mead$datetime[subset2], lake_mead$turb_NTU[subset2], pch=19, col="blue")
title("Test")

}

\keyword{datasets}
