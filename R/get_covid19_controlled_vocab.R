#' Get Information About the Elements of the covid19R controlled vocabularies
#'
#' @description Many columns of the tidy format for covid19R data use a controlled vocabulary to define standardized types. While you can read more about these in our documentation, this pulls the controlled vocabulary and description for a given vocabulary type.
#'
#' @param vocab name of a column from a dataset pulled from \code{\link{get_covid19_dataset}} or a data type listed in \code{\link{get_covid19_data_info}}
#'
#' @return a tibble with information about approved controlled vocabulary terms and their description
#' @export
#'
#' @examples
#'
#' get_covid19_controlled_vocab("data_type")
get_covid19_controlled_vocab <- function(vocab) {
  url <- paste0(repo_url, vocab_loc, vocab, ".csv")

  col_type <- "cc"

  if (vocab %in% c("location_code_type")) {
    col_type <- "ccc"
  }

  readr::read_csv(url,
    col_type = col_type
  )
}
