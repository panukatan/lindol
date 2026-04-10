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
.url <- eq_build_url(.year = 2018, .month = "January")
urls <- eq_get_bulletin_links(.url)
eq_get_bulletins(urls[1:3]) |>
  eq_process_bulletins()
#> # A tibble: 3 × 14
#>   date_time           bulletin_number longitude latitude depth magnitude
#>   <dttm>                        <int>     <dbl>    <dbl> <int>     <dbl>
#> 1 2018-01-31 23:07:37               2      13.2     125.    25       2.8
#> 2 2018-01-31 22:32:56               2      11.7     124.     7       3.7
#> 3 2018-01-31 20:23:39               2      13.0     121.    34       3.5
#> # ℹ 8 more variables: magnitude_type <chr>, reported_intensity <chr>,
#> #   location <chr>, origin <chr>, expect_damage <chr>,
#> #   expect_aftershocks <chr>, date_time_issued <dttm>, prepared_by <chr>
```
