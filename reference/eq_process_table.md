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
#> # A tibble: 1,363 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-03 04:38:20 2026-04-03 12:11:00     6.87      127.    18       2.5
#>  2 2026-04-03 04:38:20 2026-04-03 11:37:00    13.8       124.    15       1.5
#>  3 2026-04-03 04:38:20 2026-04-03 11:13:00    13.7       125.     6       1.6
#>  4 2026-04-03 04:38:20 2026-04-03 10:15:00     9.33      126.    34       2  
#>  5 2026-04-03 04:38:20 2026-04-03 10:05:00    16.7       121.    61       1.5
#>  6 2026-04-03 04:38:20 2026-04-03 09:41:00    10.9       124.     4       3.5
#>  7 2026-04-03 04:38:20 2026-04-03 09:40:00    13.8       124.     9       1.9
#>  8 2026-04-03 04:38:20 2026-04-03 09:29:00    13.8       121.    89       1.7
#>  9 2026-04-03 04:38:20 2026-04-03 09:02:00    13.6       121.    32       1.5
#> 10 2026-04-03 04:38:20 2026-04-03 07:28:00     9.68      126.    33       2  
#> # ℹ 1,353 more rows
#> # ℹ 1 more variable: location <chr>
```
