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
#> # A tibble: 546 × 7
#>    date_time           latitude longitude depth magnitude location  bulletin_url
#>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
#>  1 2026-04-10 23:00:00    17.4       120.    26       2.3 14 km N … https://ear…
#>  2 2026-04-10 21:21:00     7.43      123.    23       1.4 14 km S … https://ear…
#>  3 2026-04-10 21:10:00    13.7       121.   107       2.2 15 km S … https://ear…
#>  4 2026-04-10 20:48:00     7.67      127.    23       2.2 22 km N … https://ear…
#>  5 2026-04-10 20:30:00    17.6       121.     9       2.1 4 km N 6… https://ear…
#>  6 2026-04-10 20:00:00    16.7       120.    22       4   38 km N … https://ear…
#>  7 2026-04-10 19:01:00    16.8       120.    93       1.9 4 km S 5… https://ear…
#>  8 2026-04-10 18:08:00    17.9       121.    27       1.7 7 km S 4… https://ear…
#>  9 2026-04-10 17:14:00     8.92      127.    33       2.1 23 km N … https://ear…
#> 10 2026-04-10 16:52:00     8.29      126.    13       2.9 11 km S … https://ear…
#> # ℹ 536 more rows
```
