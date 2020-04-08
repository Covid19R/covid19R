#' Get a Specific Covid19 Tidy Dataset
#'
#' @description Fetches a chosen tidy dataset from the covid19R catalogue
#'
#' @param dataset The name of the dataset from \code{\link{get_covid19_data_info}}
#'
#' @return a tibble of data
#' @export
#'
#' @examples
#'
#' nytimes_states <- get_covid19_dataset("covid19nytimes_states")
#'
#' tail(nytimes_states)
#'

get_covid19_dataset <- function(dataset){
  url <- paste0(repo_url, data_loc, dataset, ".csv")

  readr::read_csv(url)
}
