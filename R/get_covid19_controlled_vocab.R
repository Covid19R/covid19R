get_covid19_controlled_vocab <- function(vocab){
  url <- paste0(repo_url, vocab_loc, vocab, ".csv")

  readr::read_csv(url)
}
