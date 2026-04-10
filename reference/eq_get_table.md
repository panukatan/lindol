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
#> # A tibble: 538 × 7
#>    `Date - Time(Philippine Time)` Latitude\n           …¹ Longitude\n         …²
#>    <chr>                          <chr>                   <chr>                 
#>  1 10 April 2026 - 05:14 PM       08.92                   126.51                
#>  2 10 April 2026 - 04:52 PM       08.29                   125.96                
#>  3 10 April 2026 - 03:56 PM       07.30                   126.79                
#>  4 10 April 2026 - 03:25 PM       06.35                   126.78                
#>  5 10 April 2026 - 03:21 PM       04.84                   126.29                
#>  6 10 April 2026 - 03:01 PM       04.95                   126.22                
#>  7 10 April 2026 - 02:26 PM       08.64                   126.57                
#>  8 10 April 2026 - 12:47 PM       16.23                   120.18                
#>  9 10 April 2026 - 12:35 PM       11.20                   122.46                
#> 10 10 April 2026 - 12:32 PM       14.12                   120.35                
#> # ℹ 528 more rows
#> # ℹ abbreviated names: ¹​`Latitude\n              (ºN)`,
#> #   ²​`Longitude\n              (ºE)`
#> # ℹ 4 more variables: `Depth\n              (km)` <chr>, Mag <chr>,
#> #   Location <chr>, bulletin_url <chr>
#> 
```
