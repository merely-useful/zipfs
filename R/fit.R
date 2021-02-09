dpower <- function(x, beta){
  (1/x)^(beta - 1) - (1/(x + 1))^(beta - 1)
}

# negative log likelihood l(beta) = -sum(log(f(x)))
nllpower <- function(beta, x){
  - sum(log(dpower(x = x, beta = beta)))
}

#' Estimate the Zipf's Law \eqn{\alpha} parameter
#'
#' Estimate the power law parameter, \eqn{\alpha}, for Zipf's Law from a
#' set of word frequencies.
#'
#' Estimated using maximum likelihood as outlined in:
#' Moreno-Sánchez, Isabel, Francesc Font-Clos, and Álvaro Corral.
#' 2016. “Large-Scale Analysis of Zipf’s Law in English Texts.”
#' PLoS ONE 11 (1): e0147073. <https://doi.org/10.1371/journal.pone.0147073.>
#'
#' @param n A numeric vector containing word frequencies
#'
#' @return The estimate of \eqn{\alpha} as a numeric value.
#' @export
#'
#' @examples
#' word_freqs <- count_words(dracula)
#' fit_zipfs(word_freqs$n)
fit_zipfs <- function(n){
  mle <- stats::optim(1.5, nllpower, x = n,
    lower = 1, upper = 4,
    hessian = TRUE, method = "Brent")
  beta_hat <- mle$par
  1/(beta_hat - 1)
}

