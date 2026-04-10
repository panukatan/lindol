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
#> # A tibble: 536 × 7
#>    date_time           latitude longitude depth magnitude location  bulletin_url
#>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
#>  1 2026-04-10 15:56:00     7.3       127.     9       3.3 25 km S … https://ear…
#>  2 2026-04-10 15:25:00     6.35      127.    36       2.3 85 km S … https://ear…
#>  3 2026-04-10 15:21:00     4.84      126.    10       2.8 113 km S… https://ear…
#>  4 2026-04-10 15:01:00     4.95      126.    13       3.2 101 km S… https://ear…
#>  5 2026-04-10 14:26:00     8.64      127.    26       2.4 35 km S … https://ear…
#>  6 2026-04-10 12:47:00    16.2       120.     7       2.2 20 km N … https://ear…
#>  7 2026-04-10 12:35:00    11.2       122.    26       1.8 11 km S … https://ear…
#>  8 2026-04-10 12:32:00    14.1       120.    97       1.3 31 km N … https://ear…
#>  9 2026-04-10 12:29:00     6.69      124.    22       1.9 38 km N … https://ear…
#> 10 2026-04-10 10:28:00     7.37      127.    11       2.3 27 km N … https://ear…
#> # ℹ 526 more rows
```
