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
urls <- eq_get_bulletin_urls()
eq_get_bulletins(urls[1:3])
#> # A tibble: 3 × 11
#>   date_time   bulletin_number depth magnitude location origin reported_intensity
#>   <chr>       <chr>           <chr> <chr>     <chr>    <chr>  <chr>             
#> 1 03 Apr 202… 1               018   Ms 2.5    06.87°N… TECTO… ""                
#> 2 03 Apr 202… 1               015   Ms 1.5    13.83°N… TECTO… ""                
#> 3 03 Apr 202… 1               006   Ms 1.6    13.69°N… TECTO… ""                
#> # ℹ 4 more variables: expect_damage <chr>, expect_aftershocks <chr>,
#> #   date_time_issued <chr>, prepared_by <chr>
```
