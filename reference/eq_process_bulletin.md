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
#> 1 2026-04-03 15:29:50               1      6.45     127.    33       1.9
#> 2 2026-04-03 14:51:25               1     13.8      121.    21       1.7
#> 3 2026-04-03 14:27:12               1      9.8      126.    25       1.6
#> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
#> #   location <chr>, origin <chr>, expect_damage <chr>,
#> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>
```
