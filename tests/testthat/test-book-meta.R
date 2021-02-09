test_that("Elements are extracted", {
  expect_equal(extract_element("Author: Bram Stoker", "Author"), "Bram Stoker")
  # Ideas for tests that fail, but could be fixed:
  # Return `NA` if element isn't in string
  # Should only extract text _after_ element to end of line
  # Element name should be matched case insensitively
})

test_that("`book_meta()` return error for non-text input", {
  expect_error(book_meta(1), "must be a character")
  expect_error(book_meta(TRUE), "must be a character")
})
