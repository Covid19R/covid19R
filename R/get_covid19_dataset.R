#' Get a Specific Covid19 Tidy Dataset
#'
#' @param dataset
#'
#' @return
#' @export
#'
#' @examples
get_covid19_dataset <- function(dataset){
  url <- paste0(repo_url, data_loc, dataset, ".csv")

  readr::read_csv(url)
}
