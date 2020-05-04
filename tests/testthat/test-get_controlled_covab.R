test_that("can get data info", {
  vocabs <- c("data_type", "location_type", "location_code_type")

  for(x in vocabs){
    r <- get_covid19_controlled_vocab(x)
    expect_gt(nrow(r),1)

  }
})
