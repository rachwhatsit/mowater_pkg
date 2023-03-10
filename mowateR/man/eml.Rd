\name{eml}
\alias{eml}

\docType{data}

\title{Eagle Mountain Lake (EML) Data}

\description{
\code{eml} is a data set containing vertical profile measurements from Eagle Mountain Lake. These measurements contain depth profiles of water quality variables. EML is a reservoir
in North Texas, formed by damming the West Fork of the Trinity River.
This reservoir is used for recreation, and people live all around it.
Data was collected beginning on April 25, 2019 and ending on September 12 2019. It was collected at 21 depths, every 0.5 meters
from 0.0 (surface) to 10.0 meters. A vertical profile measurement was taken once every two hours.
All times are in UTC.
}

\usage{
data(eml) # loads into working evironment
eml
}

\format{
A data frame with 35,532 rows and 7 columns:

\describe{
\item{Date-Time}{Date and two-hour time period measurement was taken}
\item{Depth}{Profile Depth, measured in meters}
\item{Temp}{Water Temperature, measured in degrees Celsius}
\item{DO}{Dissolved Oxygen, measured in mg/L}
\item{DOsat}{Dissolved Oxygen Saturation, measured as the percentage of DO relative to what the concentration would be in equilibrium with the atmosphere, calcualted as actual/expected}
\item{pH}{pH, measured as standard pH from 0 (basic) to 14 (acidic)}
\item{Cond}{Conductivity in water, measured in \eqn{\mu}S/cm (micro Siemens per centimeter)}
}
}

\source{
Professor Thad Scott from the Department of Biology at Baylor University.
Tarrant Regional Water District (TRWD) provided funding for the first year of data collection, and Eagle Mountain Lake is owned and operated by TRWD.
This lake is used to supply water to municipalities within the Dallas/Fort Worth area.
Available online: http://ec2-18-223-67-99.us-east-2.compute.amazonaws.com/test2/testIndex.html
}

\examples{
data(eml)
#- check out data
head(eml)

#- histogram of variable of interest
hist(eml$DOsat)

#- profile plots
dosat  <- eml$DOsat
depths <- seq(0, 10, length.out = 21)

plot(dosat[1:21], depths,
type = "l", xlab = "DOsat",
xlim = c(-10, 220), ylim = c(10, 0))

for (i in 2:(length(dosat)/21)) {
last  <- i*21
first <- last - 20
lines(dosat[first:last], depths)
}

}
\keyword{datasets}
