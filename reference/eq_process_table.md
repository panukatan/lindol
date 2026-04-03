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
#> # A tibble: 1,397 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-03 16:07:00 2026-04-03 23:47:00     7.12      127.     5       3  
#>  2 2026-04-03 16:07:00 2026-04-03 23:37:00     8.04      127.     1       2.7
#>  3 2026-04-03 16:07:00 2026-04-03 23:28:00     6.46      124.    10       2  
#>  4 2026-04-03 16:07:00 2026-04-03 23:16:00     6.34      124.    34       1.7
#>  5 2026-04-03 16:07:00 2026-04-03 22:41:00     9.68      126.     2       3.3
#>  6 2026-04-03 16:07:00 2026-04-03 22:40:00    21.2       122.   148       2.4
#>  7 2026-04-03 16:07:00 2026-04-03 22:23:00    18.1       121.     4       2.1
#>  8 2026-04-03 16:07:00 2026-04-03 22:12:00    13.7       121.   126       2.4
#>  9 2026-04-03 16:07:00 2026-04-03 22:05:00    17.8       121.    12       3.1
#> 10 2026-04-03 16:07:00 2026-04-03 22:01:00    17.5       121.     5       2.3
#> # ℹ 1,387 more rows
#> # ℹ 1 more variable: location <chr>
```
