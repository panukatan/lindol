# Get earthquake monitoring information from PHIVOLCS earthquake bulletin HTMLs

Get earthquake monitoring information from PHIVOLCS earthquake bulletin
HTMLs

## Usage

``` r
eq_get_tables(
  .url = "https://earthquake.phivolcs.dost.gov.ph/",
  .year = NULL,
  .month = NULL,
  latest = TRUE
)

eq_get_table(.url)
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

## Value

A list of tibble/s of raw earthquake information from PHIVOLCS.

## Examples

``` r
eq_get_tables()
#> [[1]]
#> # A tibble: 1,397 × 7
#>    date_time_retrieved `Date - Time(Philippine Time)` Latitude\n              …¹
#>    <dttm>              <chr>                          <chr>                     
#>  1 2026-04-03 16:06:57 03 April 2026 - 11:47 PM       07.12                     
#>  2 2026-04-03 16:06:57 03 April 2026 - 11:37 PM       08.04                     
#>  3 2026-04-03 16:06:57 03 April 2026 - 11:28 PM       06.46                     
#>  4 2026-04-03 16:06:57 03 April 2026 - 11:16 PM       06.34                     
#>  5 2026-04-03 16:06:57 03 April 2026 - 10:41 PM       09.68                     
#>  6 2026-04-03 16:06:57 03 April 2026 - 10:40 PM       21.16                     
#>  7 2026-04-03 16:06:57 03 April 2026 - 10:23 PM       18.10                     
#>  8 2026-04-03 16:06:57 03 April 2026 - 10:12 PM       13.71                     
#>  9 2026-04-03 16:06:57 03 April 2026 - 10:05 PM       17.81                     
#> 10 2026-04-03 16:06:57 03 April 2026 - 10:01 PM       17.50                     
#> # ℹ 1,387 more rows
#> # ℹ abbreviated name: ¹​`Latitude\n              (ºN)`
#> # ℹ 4 more variables: `Longitude\n              (ºE)` <chr>,
#> #   `Depth\n              (km)` <chr>, Mag <chr>, Location <chr>
#> 
```
