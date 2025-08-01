test_that("Number of recorded accidents correct", {

  setwd(system.file("extdata", package = "MyPackage", mustWork=TRUE))

  expected_2013 <- c(2230, 1952, 2356, 2300, 2532, 2692, 2660, 2899, 2741, 2768, 2615, 2457)
  expected_2014 <- c(2168, 1893, 2245, 2308, 2596, 2583, 2696, 2800, 2618, 2831, 2714, 2604)
  expected_2015 <- c(2368, 1968, 2385, 2430, 2847, 2765, 2998, 3016, 2865, 3019, 2724, 2781)

  calculated <- fars_summarize_years(c(2013, 2014, 2015))

  expect_equal(expected_2013, calculated$`2013`)
  expect_equal(expected_2014, calculated$`2014`)
  expect_equal(expected_2015, calculated$`2015`)

})
