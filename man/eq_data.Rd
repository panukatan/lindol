% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eq_data.R
\name{eq_data_summary}
\alias{eq_data_summary}
\alias{eq_data_bulletin}
\title{Retrieve earthquake information data from PHIVOLCS bulletins}
\usage{
eq_data_summary(
  .url = "https://earthquake.phivolcs.dost.gov.ph/",
  .year = NULL,
  .month = NULL,
  latest = TRUE
)

eq_data_bulletin(
  .url = "https://earthquake.phivolcs.dost.gov.ph/",
  .year = NULL,
  .month = NULL,
  latest = TRUE
)
}
\arguments{
\item{.url}{Base URL for PHIVOLCS earthquake bulletins.}

\item{.year}{A vector for year (in YYYY format) for which earthquake
bulletins are to be retrieved. The earliest year that can be specified is
2018. If set to NULL (default), all years starting from 2018 to present
year are used.}

\item{.month}{A vector for month for which earthquake bulletins are
to be retrieved. This can be set as either an integer index (1 for January)
or abbreviation (Jan for January) for full name. If set to NULL (default),
all months are used.}

\item{latest}{Logical. Should the latest table of earthquake information be
retrieved? Only evaluated if \code{.year = NULL} and \code{.month = NULL}. If TRUE
(default), table of earthquake information for current year and current
month is retrieved. Otherwise, all months for all possible years are
retrieved.}
}
\value{
A tibble of processed earthquake data.
}
\description{
Retrieve earthquake information data from PHIVOLCS bulletins
}
\examples{
eq_data_summary()

}
