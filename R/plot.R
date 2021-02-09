#' Rank-frequency plot
#'
#' Plots the rank vs. frequency on log-log scales, useful for
#' finding power law behaviour in word frequencies.
#'
#' The parameter used to produce the fitted line, can be directly computed
#' using [fit_zipfs()].
#'
#' @param n Numeric vector of word frequencies
#' @param add_fit Should a line with the fitted power law parameter be added?
#'
#' @return ggplot2 plot object
#' @export
#'
#' @examples
#' word_freqs <- count_words(dracula)
#' plot_rank(word_freqs$n)
#' plot_rank(word_freqs$n, add_fit = TRUE)
plot_rank <- function(n, add_fit = FALSE){
  p <- ggplot2::ggplot(
      mapping = ggplot2::aes(n, rank(dplyr::desc(n), ties.method = "max"))) +
    ggplot2::geom_point() +
    ggplot2::scale_x_log10() +
    ggplot2::scale_y_log10() +
    ggplot2::labs(
      x = "Frequency",
      y = "Rank")
  if(add_fit){
    alpha_hat <- fit_zipfs(n)
    n_words <- length(n)
    p <-
      p +
      ggplot2::geom_abline(
        intercept = log10(n_words),
        slope = - 1/alpha_hat,
        color = "grey50"
      )
  }
  p
}
