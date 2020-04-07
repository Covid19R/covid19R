#' Get Information About the Elements of the covid19R controlled vocabularies
#'
#' @param vocab
#'
#' @return a tibble with information about approved controlled vocabulary terms and their description
#' @export
#'
#' @examples
get_covid19_controlled_vocab <- function(vocab){
  url <- paste0(repo_url, vocab_loc, vocab, ".csv")

  readr::read_csv(url)
}
