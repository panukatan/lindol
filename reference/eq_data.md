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
#> # A tibble: 1,445 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-04 08:56:41 2026-04-04 16:34:00     9.85      126.    33       2.4
#>  2 2026-04-04 08:56:41 2026-04-04 16:12:00     9.78      126.    29       1.5
#>  3 2026-04-04 08:56:41 2026-04-04 15:22:00    12.1       124.     4       2.8
#>  4 2026-04-04 08:56:41 2026-04-04 15:20:00    13.7       121.    92       1.8
#>  5 2026-04-04 08:56:41 2026-04-04 14:39:00    13.5       121.    36       1.4
#>  6 2026-04-04 08:56:41 2026-04-04 14:33:00    16.0       121.    33       2  
#>  7 2026-04-04 08:56:41 2026-04-04 14:03:00     7.09      127.    18       2.3
#>  8 2026-04-04 08:56:41 2026-04-04 13:51:00     9.79      126.    33       2.1
#>  9 2026-04-04 08:56:41 2026-04-04 13:48:00     7.43      124.    32       1.5
#> 10 2026-04-04 08:56:41 2026-04-04 13:41:00     7.09      127.    13       2.5
#> # ℹ 1,435 more rows
#> # ℹ 1 more variable: location <chr>
```
