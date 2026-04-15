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
#> # A tibble: 799 × 7
#>    date_time           latitude longitude depth magnitude location  bulletin_url
#>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
#>  1 2026-04-15 17:47:00    13.4       120.     3       2.1 21 km N … https://ear…
#>  2 2026-04-15 15:51:00    16.8       121.    34       1.4 2 km S 3… https://ear…
#>  3 2026-04-15 15:34:00    15.0       122.    16       2.2 17 km N … https://ear…
#>  4 2026-04-15 15:32:00    13.2       124.    55       2.4 36 km N … https://ear…
#>  5 2026-04-15 15:29:00    14.2       120.    83       2.1 25 km N … https://ear…
#>  6 2026-04-15 14:25:00    16.2       120.    31       1.8 35 km N … https://ear…
#>  7 2026-04-15 13:56:00    14.8       122.    31       1.5 13 km N … https://ear…
#>  8 2026-04-15 13:31:00     9.07      126.    31       2.3 19 km N … https://ear…
#>  9 2026-04-15 13:00:00    15.0       122.    10       4.1 25 km N … https://ear…
#> 10 2026-04-15 11:57:00    10.4       123.    14       2   5 km N 0… https://ear…
#> # ℹ 789 more rows
```
