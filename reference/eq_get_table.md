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
#> # A tibble: 1,363 × 7
#>    date_time_retrieved `Date - Time(Philippine Time)` Latitude\n              …¹
#>    <dttm>              <chr>                          <chr>                     
#>  1 2026-04-03 04:38:18 03 April 2026 - 12:11 PM       06.87                     
#>  2 2026-04-03 04:38:18 03 April 2026 - 11:37 AM       13.83                     
#>  3 2026-04-03 04:38:18 03 April 2026 - 11:13 AM       13.69                     
#>  4 2026-04-03 04:38:18 03 April 2026 - 10:15 AM       09.33                     
#>  5 2026-04-03 04:38:18 03 April 2026 - 10:05 AM       16.70                     
#>  6 2026-04-03 04:38:18 03 April 2026 - 09:41 AM       10.93                     
#>  7 2026-04-03 04:38:18 03 April 2026 - 09:40 AM       13.76                     
#>  8 2026-04-03 04:38:18 03 April 2026 - 09:29 AM       13.78                     
#>  9 2026-04-03 04:38:18 03 April 2026 - 09:02 AM       13.58                     
#> 10 2026-04-03 04:38:18 03 April 2026 - 07:28 AM       09.68                     
#> # ℹ 1,353 more rows
#> # ℹ abbreviated name: ¹​`Latitude\n              (ºN)`
#> # ℹ 4 more variables: `Longitude\n              (ºE)` <chr>,
#> #   `Depth\n              (km)` <chr>, Mag <chr>, Location <chr>
#> 
```
