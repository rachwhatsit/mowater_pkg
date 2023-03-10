\name{reverse_osmosis}
\alias{reverse_osmosis}

\docType{data}

\title{Reverse Osmosis Filter Trials}

\description{
The reverse osmosis data set contains experiment data from a hydrokinetic
reverse osmosis pilot study, which ran 11 experiments. During the beginning of each trial, the System Mode
is set to fixed flux to acheive steady state conditions. Then, the System mode is changed to
cycle feed pressure. To simulate the increase and decrease of pressure when non-continuous
tidal energy is used to power the system, a sine wave is used to set the operating
pressure between two values. There are two modes which cycle feed pressure:
high and low. The system is controlled by a “feed pump” and a “reject value”
which generates pressure across the membrane. Observations are collected every minute.
}

\usage{
data(reverse_osmosis)  #- loads into working environment
reverse_osmosis
}


\format{
A data frame with 25,844 rows and 23 columns. Operational variables are flow rate, temperature, pressure, and flux. Variables of interest are those that measure conductivity.
}

\source{
Dr. Kirby Sitterley in collaboration with the National Renewable Energy Laboratory and Dr. Tzahi Cath from the Department of Civil and Environmental Engineering at Colorado School of Mines.
}

\examples{
#- conductivity
cols = c("yellow2", "turquoise4", "maroon4")
ts.plot(reverse_osmosis$reject_conductivity_ms,
ylim = c(0, 1000), main = "Conductivity", col = cols[1])
lines(reverse_osmosis$permeate_conductivity_low_us, col = cols[2])
lines(reverse_osmosis$permeate_conductivity_high_us, col = cols[3])
legend(2500, 1000, c("cond rej", "cond lo", "cond hi"),
col = cols, pch = "l", bg = "white")

}

\keyword{datasets}
