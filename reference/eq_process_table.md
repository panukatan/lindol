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
#> # A tibble: 545 × 7
#>    date_time           latitude longitude depth magnitude location  bulletin_url
#>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
#>  1 2026-04-10 21:21:00     7.43      123.    23       1.4 14 km S … https://ear…
#>  2 2026-04-10 21:10:00    13.7       121.   107       2.2 15 km S … https://ear…
#>  3 2026-04-10 20:48:00     7.67      127.    23       2.2 22 km N … https://ear…
#>  4 2026-04-10 20:30:00    17.6       121.     9       2.1 4 km N 6… https://ear…
#>  5 2026-04-10 20:00:00    16.7       120.    22       4   38 km N … https://ear…
#>  6 2026-04-10 19:01:00    16.8       120.    93       1.9 4 km S 5… https://ear…
#>  7 2026-04-10 18:08:00    17.9       121.    27       1.7 7 km S 4… https://ear…
#>  8 2026-04-10 17:14:00     8.92      127.    33       2.1 23 km N … https://ear…
#>  9 2026-04-10 16:52:00     8.29      126.    13       2.9 11 km S … https://ear…
#> 10 2026-04-10 15:56:00     7.3       127.     9       3.3 25 km S … https://ear…
#> # ℹ 535 more rows
```
