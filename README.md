
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lindol: An Interface to the PHIVOLCS Earthquake Bulletins <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/panukatan/lindol/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/panukatan/lindol/actions/workflows/R-CMD-check.yaml)
[![test-coverage.yaml](https://github.com/panukatan/lindol/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/panukatan/lindol/actions/workflows/test-coverage.yaml)
[![Codecov test
coverage](https://codecov.io/gh/panukatan/lindol/graph/badge.svg)](https://app.codecov.io/gh/panukatan/lindol)
[![CodeFactor](https://www.codefactor.io/repository/github/panukatan/lindol/badge)](https://www.codefactor.io/repository/github/panukatan/lindol)
[![DOI](https://zenodo.org/badge/841075120.svg)](https://zenodo.org/badge/latestdoi/841075120)
<!-- badges: end -->

The [Philippine Institute of Volcanology and Seismology
(PHIVOLCS)](https://phivolcs.dost.gov.ph/) maintains the [National
Earthquake Monitoring and Information
System](https://www.phivolcs.dost.gov.ph/earthquake-monitoring-system/)
which aims to provide accurate and timely information on significant
earthquakes and tsunami events that may significantly impact the
Philippines and ensures the accessibility and integrity of earthquake
data.

This package provides an interface to this information with functions
that harvest, process, and structure information from the frequent
earthquake bulletins released by PHIVOLCS into machine-readable
versions.

The package name **lindol** (pronounced */linˈdol/ \[lɪn̪ˈd̪ol\]*) is the
Tagalog word for earthquake.

## What does the package do?

The `{lindol}` package provides functions that harvest, process, and
structure information from the PHIVOLCS earthquake bulletins. Currently,
`{lindol}` has functions for:

1.  Building URLs for webpages containing historical and real-time
    summary earthquake information;

2.  Retrieving URLs for earthquake information bulletins containing
    historical and real-time detailed earthquake information;

3.  Extracting tabular data from webpages containing historical and
    real-time summary earthquake information;

4.  Extracting tabular data from earthquake information bulletin
    webpages containing historical and real-time detailed earthquake
    information;

5.  Processing tabular data from webpages containing historical and
    real-time summary earthquake information; and,

6.  Processing tabular data from earthquake information bulletin
    webpages containing historical and real-time detailed earthquake
    information.

## Installation

`{lindol}` is not yet on CRAN but can be installed through the
[panukatan R Universe](https://panukatan.r-universe.dev) with:

``` r
install.packages(
  "lindol",
  repos = c("https://panukatan.r-universe.dev", "https://cloud.r-project.org")
)
```

or from GitHub using the `{pak}` package with:

``` r
if (!require("pak")) install.packages("pak")
pak::pak("panukatan/lindol")
```

## Usage

The main usage of `{lindol}` is to retrieve earthquake monitoring data
from PHIVOLCS’s earthquake bulletins. The main functions are
`eq_data_summary()` and `eq_data_bulletin()` which outputs summary and
detailed earthquake information respectively. This [vignette]()
describes the structure of the PHIVOLCS earthquake information bulletin
webpages and the difference between the summary and bulletin earthquake
information.

### Summary earthquake information

The `eq_data_summary()` outputs historical and current summary
earthquake information. It can be used as follows:

``` r
## Load the package ----
library(lindol)

## Get the current year and current month data ----
eq_data_summary()
```

which provides a tibble output as follows:

    #> # A tibble: 537 × 7
    #>    date_time           latitude longitude depth magnitude location  bulletin_url
    #>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
    #>  1 2026-04-10 16:52:00     8.29      126.    13       2.9 11 km S … https://ear…
    #>  2 2026-04-10 15:56:00     7.3       127.     9       3.3 25 km S … https://ear…
    #>  3 2026-04-10 15:25:00     6.35      127.    36       2.3 85 km S … https://ear…
    #>  4 2026-04-10 15:21:00     4.84      126.    10       2.8 113 km S… https://ear…
    #>  5 2026-04-10 15:01:00     4.95      126.    13       3.2 101 km S… https://ear…
    #>  6 2026-04-10 14:26:00     8.64      127.    26       2.4 35 km S … https://ear…
    #>  7 2026-04-10 12:47:00    16.2       120.     7       2.2 20 km N … https://ear…
    #>  8 2026-04-10 12:35:00    11.2       122.    26       1.8 11 km S … https://ear…
    #>  9 2026-04-10 12:32:00    14.1       120.    97       1.3 31 km N … https://ear…
    #> 10 2026-04-10 12:29:00     6.69      124.    22       1.9 38 km N … https://ear…
    #> # ℹ 527 more rows

The output has 7 fields:

- `date_time` - Date and time (of type `POSIXct`/`POSIXt`) the specific
  earthquake was detected and recorded. This is recorded in Philippine
  Standard Time (PST);

- `longitude` - Longitude (in GPS units/decimal format) coordinate of
  the hypocentre of the detected earthquake;

- `latitude` - Latitude (in GPS units/decimal format) coordinate of the
  hypocentre of the detected earthquake;

- `depth` - Depth (in kilometres units) of the hypocentre of the
  detected earthquake;

- `magnitude` - Magnitude of the earthquake;

- `location` - Location of the earthquake in relation to a monitoring
  station; and,

- `bulletin_url` - URL for full detailed earthquake bulletin.

The default implementation of the `eq_data_summary()` function outputs
earthquake monitoring data for the current month of the current year. If
data for a specific year is needed, say for example for year 2020, then:

``` r
## Retrieve data for all months of year 2020 ----
eq_data_summary(.year = 2020)
```

which gives:

    #> # A tibble: 14,095 × 7
    #>    date_time           latitude longitude depth magnitude location  bulletin_url
    #>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
    #>  1 2020-01-31 23:50:00     6.56      125.    12       2.2 11 km S … https://ear…
    #>  2 2020-01-31 23:46:00     6.58      125.     9       2.1 10 km S … https://ear…
    #>  3 2020-01-31 23:02:00     8.59      127.    13       3.2 49 km N … https://ear…
    #>  4 2020-01-31 22:34:00     6.62      125.    13       3.6 7 km S 5… https://ear…
    #>  5 2020-01-31 21:18:00     6.57      125.    16       2.8 10 km S … https://ear…
    #>  6 2020-01-31 21:17:00    10.2       126.    18       2.9 24 km N … https://ear…
    #>  7 2020-01-31 19:35:00     6.58      125.    17       3.1 8 km S 0… https://ear…
    #>  8 2020-01-31 19:18:00     6.59      125.    13       4.9 15 km S … https://ear…
    #>  9 2020-01-31 17:46:00    10.5       126.     3       3.5 67 km N … https://ear…
    #> 10 2020-01-31 15:42:00     5.22      126.    37       3.1 77 km S … https://ear…
    #> # ℹ 14,085 more rows

### Detailed earthquake information

The `eq_data_bulletin()` outputs detailed historical and current
earthquake information. It can be used as follows:

``` r
## Get the current year and current month detailed data ----
eq_data_bulletin(.year = 2018, .month = "January")
```

which provides a tibble output as follows:

    #> # A tibble: 364 × 14
    #>    date_time           bulletin_number longitude latitude depth magnitude
    #>    <dttm>                        <int>     <dbl>    <dbl> <int>     <dbl>
    #>  1 2018-01-31 23:07:37               2     13.2      125.    25       2.8
    #>  2 2018-01-31 22:32:56               2     11.7      124.     7       3.7
    #>  3 2018-01-31 20:23:39               2     13.0      121.    34       3.5
    #>  4 2018-01-31 18:42:34               2     14.1      120.   122       1.9
    #>  5 2018-01-31 00:28:18               2     18.7      121.    22       3.3
    #>  6 2018-01-30 23:54:24               2     18.6      121.    16       2.1
    #>  7 2018-01-30 22:46:00               2      9.89     125.     5       3.3
    #>  8 2018-01-30 22:11:51               3     19.3      121.    15       4.9
    #>  9 2018-01-30 21:40:42               2     18.4      121.     8       3.1
    #> 10 2018-01-30 19:55:22               2     17.0      121.    20       2.6
    #> # ℹ 354 more rows
    #> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
    #> #   location <chr>, origin <chr>, expect_damage <chr>,
    #> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>

The output has 7 fields:

- `date_time` - Date and time (of type `POSIXct`/`POSIXt`) the specific
  earthquake was detected and recorded. This is recorded in Philippine
  Standard Time (PST);

- `bulletin_number` - Integer value for the number assigned to the
  specific bulletin;

- `depth` - Integer value for the depth at which earthquake was
  recorded;

- `magnitude` - Numeric value for the magnitude of the earthquake;

- `location` - Character value for location of the earthquake containing
  geolocation and location based on distance from a specific town or
  named place;

- `origin` - Character value for the origin type of the earthquake;

- `reported_intensity` - Character value for reported intensity of the
  earthquake;

- `expect_damage` - Logical value for whether damages are expected from
  the earthquake;

- `expect_aftershocks` - Logical value for whether aftershocks are
  expected;

- `data_time_issued` - Date and time the bulletin was issued; and,

- `prepared_by` - Character values for initials of individuals who
  prepared the bulletin.

The default implementation of the `eq_data_bulletin()` function outputs
earthquake monitoring data for the current month of the current year.
Also, the default behaviour is to perform this data extraction
sequentially i.e., every earthquake record for the specified month and
year combination one after the other. This approach can take long
specifically for month and year combinations that have many recorded
earthquakes. The `eq_data_bulletin()` function includes option for
parallelisation of this process by specifying the argument
`parallel = TRUE` which, by default, will initiate 2 parallel processes.
This can be increased (depending on the specifications of the machine
being used) by specifying the `cores` argument to the desired
appropriate number of processes to initiate.

For example, if data for a specific year is needed, say for example for
year 2019, using parallelisation using 8 parallel processes, then:

``` r
## Retrieve data for all months of year 2024 using parallelisation ----
eq_data_bulletin(.year = 2019, parallel = TRUE, cores = 8)
```

which gives:

    #> # A tibble: 12,977 × 14
    #>    date_time           bulletin_number longitude latitude depth magnitude
    #>    <dttm>                        <int>     <dbl>    <dbl> <int>     <dbl>
    #>  1 2019-01-31 14:55:06               2      9.64     122.     6       2.7
    #>  2 2019-01-31 12:13:14               3      8.44     127.    24       3.7
    #>  3 2019-01-31 11:38:57               2      9.81     126.     7       2.9
    #>  4 2019-01-31 09:05:42               2      5.45     126.    53       2.2
    #>  5 2019-01-31 07:14:33               2      5.85     126.    15       2.7
    #>  6 2019-01-31 06:13:16               2     11.5      126      1       2.8
    #>  7 2019-01-31 06:04:36               2     14.4      124.     2       1.8
    #>  8 2019-01-31 05:02:56               2     10.6      125.    27       2.3
    #>  9 2019-01-31 04:37:24               2     10.4      125.    26       2.2
    #> 10 2019-01-31 04:06:29               2      9.77     126.    14       2.1
    #> # ℹ 12,967 more rows
    #> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
    #> #   location <chr>, origin <chr>, expect_damage <chr>,
    #> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>

## Citation

If you use the `{lindol}` package in your work, please cite using the
suggested citation provided by a call to the `citation()` function as
follows:

``` r
citation("lindol")
#> To cite lindol in publications use:
#> 
#>   Ernest Guevarra (2026). _lindol: An Interface to the PHIVOLCS
#>   Earthquake Bulletins_. R package version 0.0.9000,
#>   <https://panukatan.io/lindol/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {lindol: An Interface to the PHIVOLCS Earthquake Bulletins},
#>     author = {{Ernest Guevarra}},
#>     year = {2026},
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
