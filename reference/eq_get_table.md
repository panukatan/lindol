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
#> # A tibble: 799 × 7
#>    `Date - Time(Philippine Time)` Latitude\n           …¹ Longitude\n         …²
#>    <chr>                          <chr>                   <chr>                 
#>  1 15 April 2026 - 05:47 PM       13.45                   120.27                
#>  2 15 April 2026 - 03:51 PM       16.79                   121.13                
#>  3 15 April 2026 - 03:34 PM       14.99                   122.01                
#>  4 15 April 2026 - 03:32 PM       13.19                   124.49                
#>  5 15 April 2026 - 03:29 PM       14.15                   120.42                
#>  6 15 April 2026 - 02:25 PM       16.25                   119.50                
#>  7 15 April 2026 - 01:56 PM       14.78                   121.84                
#>  8 15 April 2026 - 01:31 PM       09.07                   126.37                
#>  9 15 April 2026 - 01:00 PM       15.05                   122.06                
#> 10 15 April 2026 - 11:57 AM       10.38                   123.33                
#> # ℹ 789 more rows
#> # ℹ abbreviated names: ¹​`Latitude\n              (ºN)`,
#> #   ²​`Longitude\n              (ºE)`
#> # ℹ 4 more variables: `Depth\n              (km)` <chr>, Mag <chr>,
#> #   Location <chr>, bulletin_url <chr>
#> 
```
