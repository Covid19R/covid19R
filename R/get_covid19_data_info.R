#' What Datasets are available from covid19R
#'
#' @description Returns information about the datasets available from covid19R
#'
#' @param location_types_filter A vector of location types that you would like to include. Other location types will be removed. Defaults to `NULL`, and no filtering is done. See \code{\link{get_covid19_controlled_vocab}} for how to see possible values.
#' @param spatial_extent_filter A vector of spatial extents that you would like to include. Other extents will be removed. Defaults to `NULL`, and no filtering is done. See \code{\link{get_covid19_controlled_vocab}} for how to see possible values.
#' @param data_types_filter A vector of data types that you would like to include. Other data types will be removed. Defaults to `NULL`, and no filtering is done. See \code{\link{get_covid19_controlled_vocab}} for how to see possible values.
#'
#' @return A tibble listing what datasets are available, and additional information about them.
#' @export
#'
#' @examples
#' get_covid19_data_info()
#'

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
                    last_update = readr::col_datetime(format = "")
                  ))

  #filter on multiple values presented


  dat
}
