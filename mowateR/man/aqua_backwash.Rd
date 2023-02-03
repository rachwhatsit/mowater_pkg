\name{aqua_backwash}
\alias{aqua_backwash}

\docType{data}

\title{Cloth Filter Backwash Data}

\description{
\code{aqua_backwash} is a data set from a cloth filter water treatment system that measured twelve stormwater surge events. The variable of interest is backwash volume per minute. High backwash means that more treated water is used to clean the filters. Typically, 10\% to 18\% of total treated water is used for backwash. Modelling high backwash using variables such as turbidity, total suspended solids, and loading rates is helpful for water treatment experts. 
}

\usage{
data(aqua_backwash) #- loads into working environment
aqua_backwash
}

\format{
A data frame with 284 rows and 9 columns.

\describe{
\item{\code{event}}{Storm water event (1 - 12)}
\item{\code{sample}}{Grab samples were taken numerous times during each event}
\item{\code{hrs}}{Length of sample period}
\item{\code{bw_vol_permin}}{Gallons of treated water used for backwashes per minute}
\item{\code{tss_permin}}{Influent suspended solids (mgL) per minute}
\item{\code{turb_permin}}{Influent turbidity (ntu) per minute}
\item{\code{slr_lbs_sf_day}}{Solids loading rate (lbs / sf / day) }
\item{\code{hlr_gpm_sf}}{Hydraulic loading rate (influent flow (gpm) / filter area (sf))}
\item{\code{coag}}{\code{logi}: was coagulant added (T) or not (F)?}
}
}

\source{
Terry Reid and John Dyson of Aqua Aerobic Systems 
}

\examples{
data(aqua_backwash)

#- get a random palette of colors

cols <- sample(colors(), 9)

#- plot second event (skipping first)
event2 <- aqua_backwash[which(aqua_backwash == 2), ]

plot(bw_vol_permin ~ hrs, data = event2, xlim = c(0, 16),
     type = "b", lty = 2, pch = 20, cex = .6,
     col = cols[1],
     xlab = "Hours Since Event", ylab = "Backwash Volume / Minute",
     main = "Backwash Volume During Events", ylim = c(0, 60))

#- plot the remaining 12 events
for (ev in 3:12) {
  event <- aqua_backwash[which(aqua_backwash == ev), ]
  lines(bw_vol_permin ~ hrs, 
        data = aqua_backwash[which(aqua_backwash == ev), ], 
        type = "b", col = cols[ev],
        pch = 20, cex = .6, lty = 2)
}
}

\keyword{datasets}
