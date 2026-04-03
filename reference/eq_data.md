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
#> # A tibble: 1,370 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-03 07:53:30 2026-04-03 15:29:00     6.45      127.    33       1.9
#>  2 2026-04-03 07:53:30 2026-04-03 14:51:00    13.8       121.    21       1.7
#>  3 2026-04-03 07:53:30 2026-04-03 14:27:00     9.8       126.    25       1.6
#>  4 2026-04-03 07:53:30 2026-04-03 14:23:00     6.13      125.    19       1.5
#>  5 2026-04-03 07:53:30 2026-04-03 13:58:00    15.6       120.    70       1.6
#>  6 2026-04-03 07:53:30 2026-04-03 13:38:00    13.5       121.    43       1.7
#>  7 2026-04-03 07:53:30 2026-04-03 12:53:00    11.1       124.    22       1.9
#>  8 2026-04-03 07:53:30 2026-04-03 12:11:00     6.87      127.    18       2.5
#>  9 2026-04-03 07:53:30 2026-04-03 11:37:00    13.8       124.    15       1.5
#> 10 2026-04-03 07:53:30 2026-04-03 11:13:00    13.7       125.     6       1.6
#> # ℹ 1,360 more rows
#> # ℹ 1 more variable: location <chr>
```
