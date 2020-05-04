test_that("can get each dataset", {
  datasets <- get_covid19_data_info()
  for(x in datasets$data_set_name){
    r <- get_covid19_dataset(x)
    expect_gt(nrow(r),1)
  }
})
