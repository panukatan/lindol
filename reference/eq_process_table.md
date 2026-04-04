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
#> # A tibble: 1,445 × 7
#>    date_time_retrieved date_time           latitude longitude depth magnitude
#>    <dttm>              <dttm>                 <dbl>     <dbl> <dbl>     <dbl>
#>  1 2026-04-04 08:56:48 2026-04-04 16:34:00     9.85      126.    33       2.4
#>  2 2026-04-04 08:56:48 2026-04-04 16:12:00     9.78      126.    29       1.5
#>  3 2026-04-04 08:56:48 2026-04-04 15:22:00    12.1       124.     4       2.8
#>  4 2026-04-04 08:56:48 2026-04-04 15:20:00    13.7       121.    92       1.8
#>  5 2026-04-04 08:56:48 2026-04-04 14:39:00    13.5       121.    36       1.4
#>  6 2026-04-04 08:56:48 2026-04-04 14:33:00    16.0       121.    33       2  
#>  7 2026-04-04 08:56:48 2026-04-04 14:03:00     7.09      127.    18       2.3
#>  8 2026-04-04 08:56:48 2026-04-04 13:51:00     9.79      126.    33       2.1
#>  9 2026-04-04 08:56:48 2026-04-04 13:48:00     7.43      124.    32       1.5
#> 10 2026-04-04 08:56:48 2026-04-04 13:41:00     7.09      127.    13       2.5
#> # ℹ 1,435 more rows
#> # ℹ 1 more variable: location <chr>
```
