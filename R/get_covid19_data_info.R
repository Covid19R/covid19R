#' What Datasets are available from covid19R
#'
#' @param location_types_filter
#' @param spatial_extent_filter
#' @param data_types_filter
#'
#' @return
#' @export
#'
#' @examples
get_covid19_data_info <- function(location_types_filter = NULL,
                                  spatial_extent_filter = NULL,
                                  data_types_filter = NULL){

  url <- paste0(repo_url, data_loc, "covid19R_data_info.csv")
  dat <- readr::read_csv(url,
                  col_types = list(
                    data_set_name = readr::col_character(),
                    package_name = readr::col_character(),
                    function_to_get_data = readr::col_character(),
                    data_details = readr::col_character(),
                    data_url = readr::col_character(),
                    license_url = readr::col_character(),
                    data_types = readr::col_character(),
                    location_types = readr::col_character(),
                    spatial_extent = readr::col_character(),
                    has_geospatial_info = readr::col_logical(),
                    refresh_status = readr::col_character(),
                    last_update = readr::col_date(format = "")
                  ))
  #filter on multiple values presented
  # if(!is.null(location_types_filter)){
  #   dat <- dat %>%
  # }

  dat
}
