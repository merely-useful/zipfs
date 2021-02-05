
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

### Add book meta functions

``` r
use_r("book-meta")
# Edit R/book-meta.R to add functions
use_package("tibble")
use_package("stringr")
use_pipe()
devtools::load_all(".")
extract_element("Author: Bram Stoker", "Author")
book_meta(dracula[1:20])
# Code -> Insert Roxygen Skeleton
# Edit Roxygen comment for `book_meta()`
devtools::document()
?book_meta
```

### Add `count_words()`

``` r
use_r("count")
# Edit count.R
devtools::load_all(".")
count_words(dracula)
# Code -> Insert Roxygen Skeleton
# Edit Roxygen comment for `count_words()`
devtools::document()
?count_words
```

### Add license

``` r
use_mit_license("Charlotte Wickham")
```
