#' Rank-frequency plot
#'
#' Plots the rank vs. frequency on log-log scales, useful for
#' finding power law behaviour in word frequencies.
#'
#' @param n Numeric vector of word frequencies
#'
#' @return ggplot2 plot object
#' @export
#'
#' @examples
#' word_freqs <- count_words(dracula)
#' plot_rank(word_freqs$n)
plot_rank <- function(n){
  ggplot2::ggplot(
      mapping = ggplot2::aes(n, rank(dplyr::desc(n), ties.method = "max"))) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_x_log10() +
    ggplot2::scale_y_log10() +
    ggplot2::labs(
      x = "Frequency",
      y = "Rank")
}
