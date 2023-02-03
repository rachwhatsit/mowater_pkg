\name{colorado_springs_phos}
\alias{colorado_springs_phos}

\docType{data}

\title{Effluent Phosphorus Removal Project}

\description{
\code{colorado_springs_phos} is a data set used to identify what variables may impact effluent Phosphorus.
Phosphorus removal is an important aspect of water treatment, as high levels of phosphorus in effluent water can be dangerous to the environment. The data are hourly and measured over eight months (June 2020 to Feb 2021).
}

\usage{
data(colorado_springs_phos) #- loads into working environment
colorado_springs_phos
}

\format{
A data frame with 107 rows
and 29 variables. A few variables of interest are listed below:

\describe{
\item{\code{Phosphorus (total) effluent lab ug/L}}{This is the response of interest}
\item{\code{Total Volatile Fatty Acids effluent lab mg/L}}{}
\item{\code{Acetic Acid effluent lab mg/L}}{}
\item{\code{Total Gal Whey Added}}{}
}
}

\source{
Tara Kelly, Kirk Olds, Rachel Knobbs, and Shaun Thompson of Colorado Springs Utilities.
}

\examples{
data(colorado_springs_phos)

#- no apparent pattern in effluent phosphorus
plot(colorado_springs_phos$Dates, colorado_springs_phos$`Phosphorus (total) effluent lab ug/L`)

#- compare acestic acid with phosphorus
plot(colorado_springs_phos$`Acetic Acid effluent lab mg/L`, colorado_springs_phos$`Phosphorus (total) effluent lab ug/L`)

#- remove NAs and fit a model
color_nona <- na.omit(colorado_springs_phos)

mod <- lm(`Phosphorus (total) effluent lab ug/L` ~ . - `Ortho-Phosphate effluent lab mg/L P`, color_nona)

summary(mod)
plot(predict(mod), color_nona$`Phosphorus (total) effluent lab ug/L`)

}

\keyword{datasets}
