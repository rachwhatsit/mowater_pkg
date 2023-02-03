\name{denver_filters}
\alias{denver_filters}

\docType{data}

\title{City of Denver, CO Filter Experiment}

\description{
\code{denver_filters} is a data set containing one year of filter data for
16 different filters measured at 5 minute intervals
with the goal of comparing filters between each other and before/after media replacement. The filters run for a certain amount of time until they get too dirty, measured by increased headloss. Once headloss is high enough, the filters stop running and backwash to clean their surface. \code{denver_filters$filters} contains 16 data frames of the 5 minute data and \code{denver_filters$backwash} records the start and end of filter runs before they backwash. 
}

\usage{
#- download denver_filters.rda from Google drive
load("path/denver_filters.rda") #- loads into working environment
denver_filters$filters #- list of filter data frames
denver_filters$backwash #- backwash data frame
}

\format{
A list with two elements: a list of data frames and a backwash data frame.

\strong{(1)} \code{denver_filters$filters} is a list of 16 data frames. Each data frame has 105,384 rows and 5 columns, the variables of which are enumerated as follows:

\describe{
\item{\code{datetime}}{}
\item{\code{eff_flow}}{}
\item{\code{turbidity_ntu}}{}
\item{\code{headloss}}{}
\item{\code{eff_runtime_hr}}{}
}

\strong{(2)} \code{denver_filters$backwash} is a data frame with 3,285 rows and 6 columns, the variables of which are as follows:

\describe{
\item{\code{start}}{Index corresponding to the start of the run (assuming that the 16 filter data frames have been stacked into a long data frame in order of filters)}
\item{\code{end}}{Index corresponding to the end of the run}
\item{\code{start_time}}{Time at the start of a run}
\item{\code{end_time}}{Time at the end of a run}
\item{\code{filter}}{Filter being measured}
\item{\code{delta_time}}{Change in time from start and end of specific run}
}

}

\source{
Andrea Song and Craig McGonagill of Denver Water.
}

\examples{
data(denver_filters)

#- turbidity
filter2 <- denver_filters[[1]][[2]][1:5e3,]

plot(filter2$turbidity_ntu,
     xlab = "Time (increment of 5 min)",
     ylab = "Turbidity (NTU)",
     main = "Filter 2",
     ylim = c(0,.25),
     pch = 16,
     type = "l")

#- headloss and backwash
plot(filter2$datetime, filter2$headloss,
     xlab = "Time (increment of 5 min)",
     ylab = "Headloss",
     main = "Filter 2",
     type = "l", lwd = 2)

#- add in run time
lines(filter2$datetime, filter2$eff_runtime_hr,
      col = "red")

#- run time
filter4 <- denver_filters[[1]][[4]]
plot(filter4$eff_runtime_hr,
     ylab = "Runtime (hr)",
     main = "Run time - Filter 4",
     type = "l")
}
\keyword{datasets}
