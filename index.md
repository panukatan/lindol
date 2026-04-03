# lindol: An Interface to the PHIVOLCS Earthquake Bulletins

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

The [lindol](https://panukatan.io/lindol/) package provides functions
that harvest, process, and structure information from the PHIVOLCS
earthquake bulletins. Currently, [lindol](https://panukatan.io/lindol/)
has functions for:

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

[lindol](https://panukatan.io/lindol/) is not yet on CRAN but can be
installed through the [panukatan R
Universe](https://panukatan.r-universe.dev) with:

``` r
install.packages(
  "lindol",
  repos = c("https://panukatan.r-universe.dev", "https://cloud.r-project.org")
)
```

## Usage

The main usage of [lindol](https://panukatan.io/lindol/) is to retrieve
earthquake monitoring data from PHIVOLCS’s earthquake bulletins. The
main functions are
[`eq_data_summary()`](https://panukatan.io/lindol/reference/eq_data.md)
and
[`eq_data_bulletin()`](https://panukatan.io/lindol/reference/eq_data.md)
which outputs summary and detailed earthquake information respectively.
This [vignette](https://panukatan.io/lindol/) describes the structure of
the PHIVOLCS earthquake information bulletin webpages and the difference
between the summary and bulletin earthquake information.

### Summary earthquake information

The
[`eq_data_summary()`](https://panukatan.io/lindol/reference/eq_data.md)
outputs historical and current summary earthquake information. It can be
used as follows:

``` r
## Load the package ----
library(lindol)

## Get the current year and current month data ----
eq_data_summary()
```

which provides a tibble output as follows:

``` R
#> # A tibble: 1,329 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-02 15:20:58 2026-04-02 21:43:00     7.64      125.    21       2.4
#>  2 2026-04-02 15:20:58 2026-04-02 21:09:00    18.0       120.    21       3.7
#>  3 2026-04-02 15:20:58 2026-04-02 20:27:00    12.8       123.     7       2.6
#>  4 2026-04-02 15:20:58 2026-04-02 18:37:00     8.51      127.    13       2.3
#>  5 2026-04-02 15:20:58 2026-04-02 17:22:00    11.8       125.    34       1.8
#>  6 2026-04-02 15:20:58 2026-04-02 15:58:00     6.06      126.   101       2.7
#>  7 2026-04-02 15:20:58 2026-04-02 15:40:00     9.76      126.    35       2.2
#>  8 2026-04-02 15:20:58 2026-04-02 15:25:00    10         122.     5       2.3
#>  9 2026-04-02 15:20:58 2026-04-02 14:31:00    15.0       122.     4       2.4
#> 10 2026-04-02 15:20:58 2026-04-02 12:59:00    18.0       121.    14       1.9
#> # ℹ 1,319 more rows
#> # ℹ 1 more variable: location <chr>
```

The output has 7 fields:

- `date_time_retrieved` - Date and time (of type `POSIXct`/`POSIXt`) the
  data has been retrieved from the PHIVOLCS earthquake monitoring
  bulletins. This is basically a time stamp on when the user made a call
  to `eq_data()`;

- `date_time` - Date and time (of type `POSIXct`/`POSIXt`) the specific
  earthquake was detected and recorded. This is recorded in Philippine
  Standard Time (PST);

- `longitude` - Longitude (in GPS units/decimal format) coordinate of
  the hypocentre of the detected earthquake;

- `latitude` - Latitude (in GPS units/decimal format) coordinate of the
  hypocentre of the detected earthquake;

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
eq_data_summary(.year = 2020)
```

which gives:

``` R
#> # A tibble: 14,047 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-02 15:21:01 2020-01-31 23:50:00     6.56      125.    12       2.2
#>  2 2026-04-02 15:21:01 2020-01-31 23:46:00     6.58      125.     9       2.1
#>  3 2026-04-02 15:21:01 2020-01-31 23:02:00     8.59      127.    13       3.2
#>  4 2026-04-02 15:21:01 2020-01-31 22:34:00     6.62      125.    13       3.6
#>  5 2026-04-02 15:21:01 2020-01-31 21:18:00     6.57      125.    16       2.8
#>  6 2026-04-02 15:21:01 2020-01-31 21:17:00    10.2       126.    18       2.9
#>  7 2026-04-02 15:21:01 2020-01-31 19:35:00     6.58      125.    17       3.1
#>  8 2026-04-02 15:21:01 2020-01-31 19:18:00     6.59      125.    13       4.9
#>  9 2026-04-02 15:21:01 2020-01-31 17:46:00    10.5       126.     3       3.5
#> 10 2026-04-02 15:21:01 2020-01-31 15:42:00     5.22      126.    37       3.1
#> # ℹ 14,037 more rows
#> # ℹ 1 more variable: location <chr>
```

### Detailed earthquake information

The
[`eq_data_bulletin()`](https://panukatan.io/lindol/reference/eq_data.md)
outputs detailed historical and current earthquake information. It can
be used as follows:

``` r
## Get the current year and current month detailed data ----
eq_data_bulletin(.year = 2018, .month = "January")
```

which provides a tibble output as follows:

``` R
#> # A tibble: 372 × 14
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
#> # ℹ 362 more rows
#> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
#> #   location <chr>, origin <chr>, expect_damage <chr>,
#> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>
```

The output has 7 fields:

- `date_time_retrieved` - Date and time (of type `POSIXct`/`POSIXt`) the
  data has been retrieved from the PHIVOLCS earthquake monitoring
  bulletins. This is basically a time stamp on when the user made a call
  to `eq_data()`;

- `date_time` - Date and time (of type `POSIXct`/`POSIXt`) the specific
  earthquake was detected and recorded. This is recorded in Philippine
  Standard Time (PST);

- `longitude` - Longitude (in GPS units/decimal format) coordinate of
  the hypocentre of the detected earthquake;

- `latitude` - Latitude (in GPS units/decimal format) coordinate of the
  hypocentre of the detected earthquake;

- `depth` - Depth (in kilometres units) of the hypocentre of the
  detected earthquake;

- `magnitude` - Magnitude of the earthquake; and,

- `location` - Location of the earthquake in relation to a monitoring
  station.

The default implementation of the
[`eq_data_bulletin()`](https://panukatan.io/lindol/reference/eq_data.md)
function outputs earthquake monitoring data for the current month of the
current year. Also, the default behaviour is to perform this data
extraction sequentially i.e., every earthquake record for the specified
month and year combination one after the other. This approach can take
long specifically for month and year combinations that have many
recorded earthquakes. The
[`eq_data_bulletin()`](https://panukatan.io/lindol/reference/eq_data.md)
function includes option for parallelisation of this process by
specifying the argument `parallel = TRUE` which, by default, will
initiate 2 parallel processes. This can be increased (depending on the
specifications of the machine being used) by specifying the `cores`
argument to the desired appropriate number of processes to initiate.

For example, if data for a specific year is needed, say for example for
year 2024, using parallelisation using 8 parallel processes, then:

``` r
## Retrieve data for all months of year 2024 using parallelisation ----
eq_data_bulletin(.year = 2024, parallel = TRUE, cores = 8)
```

which gives:

## Citation

If you use the [lindol](https://panukatan.io/lindol/) package in your
work, please cite using the suggested citation provided by a call to the
[`citation()`](https://rdrr.io/r/utils/citation.html) function as
follows:

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
