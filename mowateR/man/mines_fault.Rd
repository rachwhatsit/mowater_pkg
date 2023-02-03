\name{mines_fault}
\alias{mines_fault}

\docType{data}

\title{Mines Fault Detection Data}

\description{
\code{mines_fault} is a water quality data set from Mines Waste Water Treatment Plant used to predict faults. Observations are recorded every 10 minutes from April 10, 2010 at 6:10 AM to May 11, 2010 at 5:00 AM. A fault was identified at April 24, 2010, 10:00 AM.
}

\usage{
data(mines_fault) #- loads into working environment
mines_fault
}

\format{
A data frame with 43,552 rows and 42 variables including
date, locations, water quality measurements, and true/false factors.

There are three general categories of variables, with examples included below.

\strong{(1) Cyclic Variables}: these variables can be used to model the daily and hourly trends in the data, if such trends exist. 

\strong{(2) Control Variables}: these are variables whose values are set by the operator. Examples are:

\describe{
\item{The blower flow rates}{}
\item{The transmembrane pressure}{}
\item{The "mode" of operation}{}
}

\strong{(3) Cyclic Variables}: these are variables that one may wish to monitor after controlling for the effect of the cyclic and
control variables. Examples are:

\describe{
\item{Dissolved oxygen, level in tank, temperature, and total
suspended solids in bioreactor}{}
\item{Level in membrane tank}{}
\item{DO, pH, conductivity, and TSS in the RAS (return activated
sludge)}{}
\item{Turbidity and total suspended solids in permeate}{}
}

}

\source{
Colorado School of Mines Waste Water Treatment Plant.
}


\examples{
data(mines_fault)

#- plot ph over time
plot(mines_fault$Date.Time, mines_fault$ras_ph, type = "l",
     main = "pH", xlab = "Date", ylab = "pH") 

#- line where the fault occurred
abline(v = mines_fault$Date.Time[20338], col = "red")

}



\keyword{datasets}
