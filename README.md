
<!-- README.md is generated from README.Rmd. Please edit that file -->

# zipfs

<!-- badges: start -->
<!-- badges: end -->

## Curated R History

An attempt to keep track of the R code run on the Console in the act of
creating the package.

### Add dracula data

``` r
use_data_raw("dracula")
# Edit data-raw/dracula.R
# Source data-raw/dracula.R
devtools::load_all(".")
dracula # Check data available
use_r("dracula")
# Add data docs to R/dracula.R
devtools::document(".")
?dracula # Check docs
```
