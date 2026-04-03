# Process earthquake information from PHIVOLCS bulletins

Process earthquake information from PHIVOLCS bulletins

## Usage

``` r
eq_process_bulletins(eq_df)
```

## Arguments

- eq_df:

  A tibble of earthquake information from PHIVOLCS bulletins retrieved
  using
  [`eq_get_bulletins()`](https://panukatan.io/lindol/reference/eq_get_bulletin.md).

## Value

A tibble of processed earthquake information from PHIVOLCS bulletins.

## Examples

``` r
urls <- eq_get_bulletin_urls()
eq_get_bulletins(urls[1:3]) |>
  eq_process_bulletins()
#> # A tibble: 3 × 14
#>   date_time           bulletin_number longitude latitude depth magnitude
#>   <dttm>                        <int>     <dbl>    <dbl> <int>     <dbl>
#> 1 2026-04-03 23:47:04               1      7.12     127.     5       3  
#> 2 2026-04-03 23:37:33               1      8.04     127.     1       2.7
#> 3 2026-04-03 23:28:55               1      6.46     124.    10       2  
#> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
#> #   location <chr>, origin <chr>, expect_damage <chr>,
#> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>
```
