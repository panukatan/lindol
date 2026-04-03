# Process tabular data extracted from bulletins

Process tabular data extracted from bulletins

## Usage

``` r
eq_process_tables(eq_data_list)

eq_process_table(eq_data_list)
```

## Arguments

- eq_data_list:

  A list of tibble/s of raw earthquake data extracted from PHIVOLCS
  earthquake information monitoring HTMLs using `eq_get_table`.

## Value

A tibble of processed earthquake data summaries.

## Examples

``` r
eq_tab <- eq_get_tables()
eq_process_tables(eq_tab)
#> # A tibble: 1,370 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-03 07:53:36 2026-04-03 15:29:00     6.45      127.    33       1.9
#>  2 2026-04-03 07:53:36 2026-04-03 14:51:00    13.8       121.    21       1.7
#>  3 2026-04-03 07:53:36 2026-04-03 14:27:00     9.8       126.    25       1.6
#>  4 2026-04-03 07:53:36 2026-04-03 14:23:00     6.13      125.    19       1.5
#>  5 2026-04-03 07:53:36 2026-04-03 13:58:00    15.6       120.    70       1.6
#>  6 2026-04-03 07:53:36 2026-04-03 13:38:00    13.5       121.    43       1.7
#>  7 2026-04-03 07:53:36 2026-04-03 12:53:00    11.1       124.    22       1.9
#>  8 2026-04-03 07:53:36 2026-04-03 12:11:00     6.87      127.    18       2.5
#>  9 2026-04-03 07:53:36 2026-04-03 11:37:00    13.8       124.    15       1.5
#> 10 2026-04-03 07:53:36 2026-04-03 11:13:00    13.7       125.     6       1.6
#> # ℹ 1,360 more rows
#> # ℹ 1 more variable: location <chr>
```
