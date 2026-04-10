# Retrieve raw information from PHIVOLCS earthquake information bulletins

Retrieve raw information from PHIVOLCS earthquake information bulletins

## Usage

``` r
eq_get_bulletin(.url)

eq_get_bulletins(.url)
```

## Arguments

- .url:

  A character value or vector of values for PHIVOLCS earthquake
  information bulletins

## Value

A tibble of earthquake information from PHIVOLCS bulletins

## Examples

``` r
.url <- eq_build_url(.year = 2023, .month = "January")
urls <- eq_get_bulletin_links(.url)
eq_get_bulletins(urls[1:3])
#> # A tibble: 3 × 11
#>   date_time   bulletin_number depth magnitude location origin reported_intensity
#>   <chr>       <chr>           <chr> <chr>     <chr>    <chr>  <chr>             
#> 1 31 Jan 202… 2               043   Ms 3.2    08.39°N… TECTO… ""                
#> 2 31 Jan 202… 2               031   Ms 2.0    07.88°N… TECTO… ""                
#> 3 31 Jan 202… 2               064   Ms 2.0    05.76°N… TECTO… ""                
#> # ℹ 4 more variables: expect_damage <chr>, expect_aftershocks <chr>,
#> #   date_time_issued <chr>, prepared_by <chr>
```
