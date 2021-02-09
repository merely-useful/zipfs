extract_element <- function(text, element){
  text  %>%
    stringr::str_subset(element) %>%
    stringr::str_remove(paste0(element, ": "))
}

#' Get book meta data from a Gutenberg book
#'
#' @param text A character string of lines from a Gutenberg book
#'
#' @return a one row tibble with `author`, `title` and `release` columns.
#' @export
#'
#' @examples
#' book_meta(dracula[1:20])
book_meta <- function(text){
  if(!is.character(text)){
    stop("`text` must be a character vector.", call. = FALSE)
  }
  tibble::tibble(
    author = extract_element(text, "Author"),
    title = extract_element(text, "Title"),
    release = extract_element(text, "Release Date")
  )
}
