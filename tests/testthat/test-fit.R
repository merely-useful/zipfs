test_that("alpha estimated correctly", {
  # test used in py-rse
  max_freq <- 600
  word_counts <- floor(max_freq / 1:(max_freq))
  expect_equal(fit_zipfs(word_counts), 1.0, tolerance = 0.01)
})


