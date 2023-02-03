\name{hazen}
\alias{hazen}

\docType{data}

\title{Filter Backwash and Dosing Data}

\description{
This data list contains four rich data sets designed for various purposes.

\code{hazen$filters} is a data frame containing a times series for sixteen filters. This data set can be used to visualize headloss, which is a measurement of filter congestion, over time across different filters. 

\code{hazen$filter_runtime} is a list of data frames derived from \code{hazen$filters}. When filters become too clogged, headloss increases and a backwash occurs. This data set summarizes the data from \code{hazen$filters} between each backwash, so each observation (row) is the mean of the corresponding rows during the same period in \code{hazen$filters}. 

\code{hazen$chem_dosing} is a large collection of chemical dosing measurements. The original purpose was to investigate the impact of chemical dosing (particularly alum) on settled water turbidity. 

\code{hazen$headloss_accumulation} is a data set for predicting backwashes, which occur when filters become clogged. The variable of interest is headloss and explanatory variables include effluent filter turbidity, alum dosage (a coagulant added to remove debris from the water), and water temperature. Each observation (row) denotes a period between backwashes. This data set is derived from \code{hazen$filter_runtime} and \code{hazen$chem_dosing}.
}

\usage{
data(hazen) #- loads into working environment
hazen
hazen$filters #- first data set
hazen$filter_runtime #- second data set
hazen$chem_dosing #- third data set
hazen$headloss_accumulation #- fourth data set
}

\format{
A list of four elements: one list and three data frames.

\strong{(1)} \code{hazen$filters} is a data frame with 428,960 rows and 5 columns containing hourly measurements from November 1, 2017 to November 22, 2020. The variables are described below:

\describe{
\item{\code{datetime}}{}
\item{\code{flow_mgd}}{Measured in millions of gallons per day}
\item{\code{loss_of_head_ft}}{Headloss (measure of filter congestion)}
\item{\code{turbidity_NTU}}{}
\item{\code{filter_indx}}{which filter these data come from}
}

\strong{(2)} \code{hazen$filter_runtime} is list with 16 data frames, each of which has varying rows and 6 columns. The variables in each data frame are described below:

\describe{
\item{\code{datetime}}{}
\item{\code{runtime_hr}}{Length of time between backwashes}
\item{\code{mean_flow_mgd}}{Measured in millions of gallons per day, averaged over the runtime}
\item{\code{mean_turbidity_NTU}}{Measured in miligrams per liter (mg/L), averaged over the runtime}
\item{\code{mean_headloss_ft}}{The headloss in feet averaged over the runtime}
\item{\code{headloss_accumulation_rate_ft.hr}}{The difference between the max and min headloss over the period averaged over the runtime}
}


\strong{(3)} \code{hazen$chem_dosing} is a data frame with 1,004 rows and 50 columns. There are too many columns to describe, but the data frame contains measurements of chemical dosing as well as water quality in many different locations/steps of the process. For instance, water quality variables (such as pH) are measured for raw, settled, and finished water (all occuring at different points in the treatment process).  

\strong{(4)} \code{hazen$headloss_accumulation} is a data frame with 1,218 rows and 8 columns. The variables in the data frame are described below:

\describe{
\item{\code{datetime}}{}
\item{\code{filter_indx}}{16 total filters were observed}
\item{\code{runtime_hr}}{Length of time between backwashes}
\item{\code{headloss_accum_rate_fthr}}{The headloss in feet averaged over the runtime}
\item{\code{mean_turbidity_NTU}}{}
\item{\code{mean_flow_mgd}}{Measured in millions of gallons per day, averaged over the runtime}
\item{\code{meanalum}}{Measured in mg/L, averaged over the runtime}
\item{\code{meantemp}}{Measured in Celsius, averaged over the runtime}
}
}

\source{
Ben Stanford and Troy Walker of Hazen and Sawyer.
}

\examples{
data(hazen)

#- first filter
filters_1 <- hazen$filters[which(hazen$filters$filter_indx == 1), ]

#- observe head loss over time for the first filter
plot(filters_1$datetime, filters_1$loss_of_head_ft, type = "l")

#- look at modelling headloss
headloss_accum <- hazen$headloss_accumulation

mod <- lm(headloss_accum_rate_fthr ~ ., headloss_accum)
summary(mod)

#- higher run time corresponds to lower head loss 
plot(headloss_accum$runtime_hr, headloss_accum$headloss_accum_rate_fthr)
}

\keyword{datasets}
