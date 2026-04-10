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
#> # A tibble: 546 × 7
#>    `Date - Time(Philippine Time)` Latitude\n           …¹ Longitude\n         …²
#>    <chr>                          <chr>                   <chr>                 
#>  1 10 April 2026 - 11:00 PM       17.36                   120.32                
#>  2 10 April 2026 - 09:21 PM       07.43                   122.68                
#>  3 10 April 2026 - 09:10 PM       13.73                   120.55                
#>  4 10 April 2026 - 08:48 PM       07.67                   126.74                
#>  5 10 April 2026 - 08:30 PM       17.59                   120.53                
#>  6 10 April 2026 - 08:00 PM       16.74                   119.88                
#>  7 10 April 2026 - 07:01 PM       16.83                   120.35                
#>  8 10 April 2026 - 06:08 PM       17.91                   120.57                
#>  9 10 April 2026 - 05:14 PM       08.92                   126.51                
#> 10 10 April 2026 - 04:52 PM       08.29                   125.96                
#> # ℹ 536 more rows
#> # ℹ abbreviated names: ¹​`Latitude\n              (ºN)`,
#> #   ²​`Longitude\n              (ºE)`
#> # ℹ 4 more variables: `Depth\n              (km)` <chr>, Mag <chr>,
#> #   Location <chr>, bulletin_url <chr>
#> 
```
