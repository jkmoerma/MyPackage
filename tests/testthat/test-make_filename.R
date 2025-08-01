test_that("File naming convention is adhered to!", {
  expected_filename <- "./accident_2013.csv.bz2"
  generated_filename <- make_filename(2013)
  expect_equal(expected_filename, generated_filename)
})
