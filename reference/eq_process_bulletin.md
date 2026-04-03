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
#> 1 2026-04-03 12:11:13               1      6.87     127.    18       2.5
#> 2 2026-04-03 11:37:12               1     13.8      124.    15       1.5
#> 3 2026-04-03 11:13:28               1     13.7      125.     6       1.6
#> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
#> #   location <chr>, origin <chr>, expect_damage <chr>,
#> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>
```
