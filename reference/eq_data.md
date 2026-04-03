# Retrieve earthquake information data from PHIVOLCS bulletins

Retrieve earthquake information data from PHIVOLCS bulletins

## Usage

``` r
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
  latest = TRUE,
  parallel = FALSE,
  cores = 2
)
```

## Arguments

- .url:

  Base URL for PHIVOLCS earthquake bulletins.

- .year:

  A vector for year (in YYYY format) for which earthquake bulletins are
  to be retrieved. The earliest year that can be specified is 2018. If
  set to NULL (default), all years starting from 2018 to present year
  are used.

- .month:

  A vector for month for which earthquake bulletins are to be retrieved.
  This can be set as either an integer index (1 for January) or
  abbreviation (Jan for January) for full name. If set to NULL
  (default), all months are used.

- latest:

  Logical. Should the latest table of earthquake information be
  retrieved? Only evaluated if `.year = NULL` and `.month = NULL`. If
  TRUE (default), table of earthquake information for current year and
  current month is retrieved. Otherwise, all months for all possible
  years are retrieved.

- parallel:

  Logical. Should the function use parallelisation? Default to FALSE.

- cores:

  The number of computer cores to use or number of child processes to be
  run simultaneously. Default to one less than the available number of
  cores on current machine.

## Value

A tibble of processed earthquake data.

## Examples

``` r
eq_data_summary()
#> # A tibble: 1,397 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-03 16:06:53 2026-04-03 23:47:00     7.12      127.     5       3  
#>  2 2026-04-03 16:06:53 2026-04-03 23:37:00     8.04      127.     1       2.7
#>  3 2026-04-03 16:06:53 2026-04-03 23:28:00     6.46      124.    10       2  
#>  4 2026-04-03 16:06:53 2026-04-03 23:16:00     6.34      124.    34       1.7
#>  5 2026-04-03 16:06:53 2026-04-03 22:41:00     9.68      126.     2       3.3
#>  6 2026-04-03 16:06:53 2026-04-03 22:40:00    21.2       122.   148       2.4
#>  7 2026-04-03 16:06:53 2026-04-03 22:23:00    18.1       121.     4       2.1
#>  8 2026-04-03 16:06:53 2026-04-03 22:12:00    13.7       121.   126       2.4
#>  9 2026-04-03 16:06:53 2026-04-03 22:05:00    17.8       121.    12       3.1
#> 10 2026-04-03 16:06:53 2026-04-03 22:01:00    17.5       121.     5       2.3
#> # ℹ 1,387 more rows
#> # ℹ 1 more variable: location <chr>
```
