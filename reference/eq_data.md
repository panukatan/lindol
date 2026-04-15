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
#> # A tibble: 799 × 7
#>    date_time           latitude longitude depth magnitude location  bulletin_url
#>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
#>  1 2026-04-15 17:47:00    13.4       120.     3       2.1 21 km N … https://ear…
#>  2 2026-04-15 15:51:00    16.8       121.    34       1.4 2 km S 3… https://ear…
#>  3 2026-04-15 15:34:00    15.0       122.    16       2.2 17 km N … https://ear…
#>  4 2026-04-15 15:32:00    13.2       124.    55       2.4 36 km N … https://ear…
#>  5 2026-04-15 15:29:00    14.2       120.    83       2.1 25 km N … https://ear…
#>  6 2026-04-15 14:25:00    16.2       120.    31       1.8 35 km N … https://ear…
#>  7 2026-04-15 13:56:00    14.8       122.    31       1.5 13 km N … https://ear…
#>  8 2026-04-15 13:31:00     9.07      126.    31       2.3 19 km N … https://ear…
#>  9 2026-04-15 13:00:00    15.0       122.    10       4.1 25 km N … https://ear…
#> 10 2026-04-15 11:57:00    10.4       123.    14       2   5 km N 0… https://ear…
#> # ℹ 789 more rows
```
