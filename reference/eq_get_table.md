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
#> # A tibble: 1,445 × 7
#>    date_time_retrieved `Date - Time(Philippine Time)` Latitude\n              …¹
#>    <dttm>              <chr>                          <chr>                     
#>  1 2026-04-04 08:56:45 04 April 2026 - 04:34 PM       09.85                     
#>  2 2026-04-04 08:56:45 04 April 2026 - 04:12 PM       09.78                     
#>  3 2026-04-04 08:56:45 04 April 2026 - 03:22 PM       12.14                     
#>  4 2026-04-04 08:56:45 04 April 2026 - 03:20 PM       13.72                     
#>  5 2026-04-04 08:56:45 04 April 2026 - 02:39 PM       13.48                     
#>  6 2026-04-04 08:56:45 04 April 2026 - 02:33 PM       15.96                     
#>  7 2026-04-04 08:56:45 04 April 2026 - 02:03 PM       07.09                     
#>  8 2026-04-04 08:56:45 04 April 2026 - 01:51 PM       09.79                     
#>  9 2026-04-04 08:56:45 04 April 2026 - 01:48 PM       07.43                     
#> 10 2026-04-04 08:56:45 04 April 2026 - 01:41 PM       07.09                     
#> # ℹ 1,435 more rows
#> # ℹ abbreviated name: ¹​`Latitude\n              (ºN)`
#> # ℹ 4 more variables: `Longitude\n              (ºE)` <chr>,
#> #   `Depth\n              (km)` <chr>, Mag <chr>, Location <chr>
#> 
```
