\name{geosmin}
\alias{geosmin}

\docType{data}

\title{Geosmin (Taste & Odor) Prediction Study}

\description{
Geosmin is an unpleasant taste and odor compound occuring in some water bodies that requires treatment. \code{geosmin} is a data set comprised of two data smaller data sets: \code{goesmin$measurements}, which contains Geosmin measurements and \code{geosmin$water_quality} which contains various water quality observations. The datetimes between the two data sets are not identical, so to use \code{geosmin$water_quality} to predict or model Geosmin, the data need to be made concurrent.
}

\usage{
data(geosmin) #- loads into working environment
geosmin
geosmin$measurements #- geosmin measurements data frame
geosmin$water_quality #- water quality data frame
}

\format{

A list of two data frames. 

\strong{(1)} \code{geosmin$measurements} is a data frame with 881 rows and 3 columns.

\describe{
\item{\code{Datetime}}{}
\item{\code{Depth}}{Measured in meters from surface (m)}
\item{\code{GeosminEntry}}{Geosmin measurement (ng/L)}
}

\strong{(2)} \code{geosmin$water_quality} is a data frame with 35,923 rows and 8 columns. 

\describe{
\item{\code{Datetime}}{}
\item{\code{Depth}}{Measured in meters from surface (m)}
\item{\code{Conductivity}}{Measured in microSiemens per cm (uS/cm)}
\item{\code{DO}}{Measured in miligrams per liter (mg/L)}
\item{\code{pH}}{}
\item{\code{Saturation}}{Dissolved Oxygen (DO) percent saturation: the proportion of dissolved oxygen in the water relative to the atmospheric concentration}
\item{\code{Temperature}}{Measured in Celsius (C)}
\item{\code{Turbidity}}{Measured in ntu}
}
}

\source{
Provided anonymously by a water treatment plant. 
}

\examples{
data(geosmin)

#- separate the data list into two data sets
geo <- geosmin$measurements
wq  <- geosmin$water_quality

#- majority of geosmin observations are from depth == 1
table(geo$Depth)

#- majority of wq occur around depth 5. For now we will use depth == 1
table(round(wq$Depth))

#- also, only consider obs between 2018 and 2020
jan1_2018 <- as.POSIXct("2018-01-01 00:00:00", tz = "UTC")
dec31_2020 <- as.POSIXct("2020-12-31 11:59:59", tz = "UTC")

geo_1 <- geo[which(geo$Depth == 1 & geo$Datetime < dec31_2020 & geo$Datetime > jan1_2018), ]
wq_1 <- wq[which(round(wq$Depth) == 1 & wq$Datetime < dec31_2020 & wq$Datetime > jan1_2018), ]


#- suppose we want to predict geosmin with DO and temp
#- we can smooth these three variables to obtain concurrent observations
geo_smooth <- smooth.spline(na.omit(geo_1$GeosminEntry),  lambda = 1e-6)
do_smooth <- smooth.spline(na.omit(wq_1$DO), lambda = 1e-6)
temp_smooth <- smooth.spline(na.omit(wq_1$Temperature), lambda = 1e-6)

geo_grid <- seq(min(geo_smooth$x), max(geo_smooth$x), length.out = 200)
do_grid <- seq(min(do_smooth$x), max(do_smooth$x), length.out = 200)
temp_grid <- seq(min(temp_smooth$x), max(temp_smooth$x), length.out = 200)

newdat <- data.frame(geosmin = predict(geo_smooth, geo_grid)$y,
                     do = predict(do_smooth, do_grid)$y,
                     temp = predict(temp_smooth, temp_grid)$y)
pairs(newdat)

#- this model is not very helpful!
mod <- lm(newdat$geosmin ~ newdat$do + newdat$temp)
summary(mod)
predict(mod)
plot(newdat$geosmin, predict(mod))

}

\keyword{datasets}
