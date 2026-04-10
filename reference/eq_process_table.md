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
#> # A tibble: 536 × 7
#>    date_time           latitude longitude depth magnitude location  bulletin_url
#>    <dttm>                 <dbl>     <dbl> <dbl>     <dbl> <chr>     <chr>       
#>  1 2026-04-10 15:56:00     7.3       127.     9       3.3 25 km S … https://ear…
#>  2 2026-04-10 15:25:00     6.35      127.    36       2.3 85 km S … https://ear…
#>  3 2026-04-10 15:21:00     4.84      126.    10       2.8 113 km S… https://ear…
#>  4 2026-04-10 15:01:00     4.95      126.    13       3.2 101 km S… https://ear…
#>  5 2026-04-10 14:26:00     8.64      127.    26       2.4 35 km S … https://ear…
#>  6 2026-04-10 12:47:00    16.2       120.     7       2.2 20 km N … https://ear…
#>  7 2026-04-10 12:35:00    11.2       122.    26       1.8 11 km S … https://ear…
#>  8 2026-04-10 12:32:00    14.1       120.    97       1.3 31 km N … https://ear…
#>  9 2026-04-10 12:29:00     6.69      124.    22       1.9 38 km N … https://ear…
#> 10 2026-04-10 10:28:00     7.37      127.    11       2.3 27 km N … https://ear…
#> # ℹ 526 more rows
```
