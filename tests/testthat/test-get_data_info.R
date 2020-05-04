test_that("can get data info", {
  r <- get_covid19_data_info()
  expect_gt(nrow(r),1)
})
