get_covid19_dataset <- function(dataset){
  url <- paste0(repo_url, data_loc, dataset, ".csv")

  readr::read_csv(url)
}
