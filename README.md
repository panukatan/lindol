
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lindol: An Interface to the PHIVOLCS Earthquake Bulletins <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check.yaml](https://github.com/panukatan/lindol/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/panukatan/lindol/actions/workflows/R-CMD-check.yaml)
[![test-coverage.yaml](https://github.com/panukatan/lindol/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/panukatan/lindol/actions/workflows/test-coverage.yaml)
[![Codecov test
coverage](https://codecov.io/gh/panukatan/lindol/branch/main/graph/badge.svg)](https://app.codecov.io/gh/panukatan/lindol?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/panukatan/lindol/badge)](https://www.codefactor.io/repository/github/panukatan/lindol)
[![DOI](https://zenodo.org/badge/841075120.svg)](https://zenodo.org/badge/latestdoi/841075120)
<!-- badges: end -->

The [Philippine Institute of Volcanology and Seismology
(PHIVOLCS)](https://phivolcs.dost.gov.ph/) maintains the National
Earthquake Monitoring and Information which aims to provide accurate and
timely information on significant earthquakes and tsunami events that
may significantly impact the Philippines and ensures the accessibility
and integrity of earthquake data.

This package provides an interface to this information with functions
that harvest, process, and structure information from the frequent
earthquake bulletins released by PHIVOLCS into machine-readable
versions.

The package name **lindol** (pronounced */linˈdol/ \[lɪn̪ˈd̪ol\]*) is
the Tagalog word for earthquake.

## What does `lindol` do?

The `lindol` package provides functions that harvest, process, and
structure information from the PHIVOLCS earthquake bulletins. Currently,
`lindol` has functions for:

1.  Building URLs for archived and current webpages that contain
    real-time earthquake information;

2.  Extracting tabular data from webpages containing real-time
    earthquake information; and,

3.  Processing tabular data from webpages containing real-time
    earthquake information.

## Installation

`lindol` is not yet on CRAN but can be installed through the panukatan R
Universe with:

``` r
install.packages(
  "lindol",
  repos = c("https://panukatan.r-universe.dev", "https://cloud.r-project.org")
)
```

## Usage

The main usage of `lindol` is to retrieve earthquake monitoring data
from PHIVOLCS’s earthquake bulletins. The main function is `eq_data()`
and can be used as follows:

``` r
## Load the package ----
library(lindol)

## Get the current year and current month data ----
eq_data()
```

which provides a tibble output as follows:

    #> # A tibble: 1,247 × 7
    #>    date_time_retrieved date_time           latitude longitude depth magnitude
    #>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
    #>  1 2024-08-16 06:53:56 2024-08-16 13:25:00     7.83      127.    27       2.4
    #>  2 2024-08-16 06:53:56 2024-08-16 12:28:00     6.38      124.    19       2.2
    #>  3 2024-08-16 06:53:56 2024-08-16 10:40:00    12.8       125.    19       2.6
    #>  4 2024-08-16 06:53:56 2024-08-16 10:31:00    10.0       126.    88       4.1
    #>  5 2024-08-16 06:53:56 2024-08-16 10:09:00     8.67      126.    30       2.3
    #>  6 2024-08-16 06:53:56 2024-08-16 09:53:00    15.0       120.    10       3  
    #>  7 2024-08-16 06:53:56 2024-08-16 09:02:00    19.6       121.     1       2.9
    #>  8 2024-08-16 06:53:56 2024-08-16 08:20:00    13.2       120.    27       3.7
    #>  9 2024-08-16 06:53:56 2024-08-16 07:48:00    12.2       125.    44       1.7
    #> 10 2024-08-16 06:53:56 2024-08-16 07:32:00    14.0       120.    22       2.2
    #> # ℹ 1,237 more rows
    #> # ℹ 1 more variable: location <chr>

The output has 7 fields:

  - `date_time_retrieved` - Date and time (of type `POSIXct`/`POSIXt`)
    the data has been retrieved from the PHIVOLCS earthquake monitoring
    bulletins. This is basically a time stamp on when the user made a
    call to `eq_data()`;

  - `date_time` - Date and time (of type `POSIXct`/`POSIXt`) the
    specific earthquake was detected and recorded. This is recorded in
    Philippine Standard Time (PST);

  - `longitude` - Longitude (in GPS units/decimal format) coordinate of
    the hypocentre of the detected earthquake;

  - `latitude` - Latitude (in GPS units/decimal format) coordinate of
    the hypocentre of the detected earthquake;

  - `depth` - Depth (in kilometres units) of the hypocentre of the
    detected earthquake;

  - `magnitude` - Magnitude of the earthquake; and,

  - `location` - Location of the earthquake in relation to a monitoring
    station.

The default implementation of the `eq_data()` function outputs
earthquake monitoring data for the current month of the current year. If
data for a specific year is needed, say for example for year 2020, then:

``` r
## Retrieve data for all months of year 2020 ----
eq_data(.year = 2020)
```

which gives:

    #> # A tibble: 14,047 × 7
    #>    date_time_retrieved date_time           latitude longitude depth magnitude
    #>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
    #>  1 2024-08-16 06:53:57 2020-01-31 23:50:00     6.56      125.    12       2.2
    #>  2 2024-08-16 06:53:57 2020-01-31 23:46:00     6.58      125.     9       2.1
    #>  3 2024-08-16 06:53:57 2020-01-31 23:02:00     8.59      127.    13       3.2
    #>  4 2024-08-16 06:53:57 2020-01-31 22:34:00     6.62      125.    13       3.6
    #>  5 2024-08-16 06:53:57 2020-01-31 21:18:00     6.57      125.    16       2.8
    #>  6 2024-08-16 06:53:57 2020-01-31 21:17:00    10.2       126.    18       2.9
    #>  7 2024-08-16 06:53:57 2020-01-31 19:35:00     6.58      125.    17       3.1
    #>  8 2024-08-16 06:53:57 2020-01-31 19:18:00     6.59      125.    13       4.9
    #>  9 2024-08-16 06:53:57 2020-01-31 17:46:00    10.5       126.     3       3.5
    #> 10 2024-08-16 06:53:57 2020-01-31 15:42:00     5.22      126.    37       3.1
    #> # ℹ 14,037 more rows
    #> # ℹ 1 more variable: location <chr>

## Citation

If you find the `lindol` package useful please cite using the suggested
citation provided by a call to the `citation()` function as follows:

``` r
citation("lindol")
#> To cite lindol in publications use:
#> 
#>   Ernest Guevarra (2024). _lindol: An Interface to the PHIVOLCS
#>   Earthquake Bulletins_. R package version 0.0.9000,
#>   <https://panukatan.io/lindol/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {lindol: An Interface to the PHIVOLCS Earthquake Bulletins},
#>     author = {{Ernest Guevarra}},
#>     year = {2024},
#>     note = {R package version 0.0.9000},
#>     url = {https://panukatan.io/lindol/},
#>   }
```

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/panukatan/lindol/issues). If you
would like to contribute to the package, please see our [contributing
guidelines](https://panukatan.io/lindol/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://panukatan.io/lindol/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.
