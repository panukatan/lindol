
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lindol: An Interface to the PHIVOLCS Earthquake Bulletins

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

The [Philippine Institute of Volcanology and Seismology
(PHIVOLCS)](https://phivolcs.dost.gov.ph/) maintains the National
Earthquake Monitoring and Information which aims to provide accurate and
timely information on significant earthquakes and tsunami events that
may significantly impact the Philippines and ensures the accessibility
and integrity of earthquake data.

This package provides an interface to this information with functions
that harvest, process, and structure information from the frequent
earthquake bulletins released by PHIVOLCS into machine-readable
versions.

The package name **lindol** (pronounced */linˈdol/ \[lɪn̪ˈd̪ol\]*) is
the Tagalog word for earthquake.

## What does `lindol` do?

The `lindol` package provides functions that harvest, process, and
structure information from the PHIVOLCS earthquake bulletins. Currently,
`lindol` has functions for:

1.  Building URLs for archived and current webpages that contain
    real-time earthquake information;

2.  Extracting tabular data from webpages containing real-time
    earthquake information; and,

3.  Processing tabular data from webpages containing real-time
    earthquake information.

## Installation

`lindol` is not yet on CRAN but can be installed through the Panukatan R
Universe with:

``` r
install.packages(
  "lindol",
  repos = c("https://panukatan.r-universe.dev", "https://cloud.r-project.org")
)
```

## Usage

## Citation

If you find the `lindol` package useful please cite using the suggested
citation provided by a call to the `citation()` function as follows:

``` r
citation("lindol")
#> To cite lindol in publications use:
#> 
#>   Ernest Guevarra (2024). _lindol: An Interface to the PHIVOLCS
#>   Earthquake Bulletins_. R package version 0.0.9000,
#>   <https://panukatan.io/lindol/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {lindol: An Interface to the PHIVOLCS Earthquake Bulletins},
#>     author = {{Ernest Guevarra}},
#>     year = {2024},
#>     note = {R package version 0.0.9000},
#>     url = {https://panukatan.io/lindol/},
#>   }
```

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/panukatan/lindol/issues). If you
would like to contribute to the package, please see our [contributing
guidelines](https://panukatan.io/lindol/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://panukatan.io/lindol/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.
