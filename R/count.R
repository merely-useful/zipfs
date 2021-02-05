#' Count word frequency in text
#'
#' Counts the occurrence of words over all elements provided in `text`.
#'
#' Each element of `text` is considered a line.
#' Lines are first converted to lower case then split into words
#' by whitespace. Then punctuation is removed, and empty strings are ignored.
#'
#' @param text A character vector
#'
#' @return A tibble with columns `word`,
#' and `n` the number of times `word` occurs in `text`.
#' @export
#'
#' @examples
#' count_words(dracula)
count_words <- function(text) {
  chunks <-
    text %>%
    stringr::str_to_lower() %>%
    # split by one or more whitespace characters
    stringr::str_split("\\s+") %>%
    unlist()

  words <-
    chunks %>%
    # remove punctuation
    stringr::str_remove_all(pattern = "[[:punct:]]+")

  # get rid of empty strings
  words <- words[words != ""]

  word_freq <- table(words) %>% sort(decreasing = TRUE)

  tibble::tibble(word = names(word_freq), n = as.numeric(word_freq))
}
