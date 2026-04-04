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
#> 1 04 Apr 202… 1               033   Ms 2.4    09.85°N… TECTO… This is an afters…
#> 2 04 Apr 202… 1               029   Ms 1.5    09.78°N… TECTO… This is an afters…
#> 3 04 Apr 202… 1               004   Ms 2.8    12.14°N… TECTO… Instrumental Inte…
#> # ℹ 4 more variables: expect_damage <chr>, expect_aftershocks <chr>,
#> #   date_time_issued <chr>, prepared_by <chr>
```
